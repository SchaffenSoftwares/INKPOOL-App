import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inkpool/Participants/dashboard.dart';
import 'package:inkpool/Participants/timeline.dart';
import 'package:inkpool/services/auth_service.dart';
import 'package:inkpool/services/database.dart';
import 'package:inkpool/services/helper.dart';
import 'package:inkpool/services/userdata.dart';
import 'package:inkpool/utils/common.dart';
import 'package:inkpool/wrapper.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final AuthService _auth = AuthService();
  final UserData us = UserData();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  String username = "";
  String _password = "";
  String error = "";

  Widget _buildEmailTF() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Username',
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (val) => val.isEmpty ? 'Enter your Username' : null,
              onChanged: (val) {
                setState(() {
                  username = val;
                });
              },
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Username',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: TextFormField(
              validator: (val) => val.isEmpty ? 'Enter a Password' : null,
              onChanged: (val) {
                setState(() {
                  _password = val;
                });
              },
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
        ),
      ),
    );
  }*/

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.blueGrey[800],
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          /*if(_formKey.currentState.validate() && _formKey2.currentState.validate()){
            dynamic result = await _auth.signInWithEmailAndPassword(_email, _password);
            if(result == null){
              setState(() {
                error = 'Wrong Credentials';
              });
            }
            else
              {
                String sub = _password.substring(7);
                int password = int.parse(sub);
                UserData(index: password);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard(),));
              }
          }*/
          if (await Database().login(username, _password)) {
            setState(() {
              error = 'Wrong Credentials';
            });
          } else {
            await HelperFunc.saveUsername(username);
            await HelperFunc.saveUserloggedIn(true);
            isLoggedIn = await HelperFunc.getUserloggedIn();
            setState(() {});
            print(username +
                ' ' +
                isLoggedIn.toString()
                );
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Wrapper(),
            ));
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.blueGrey[800],
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        child: Image(
          image: AssetImage('assets/landing.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Merriweather',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 30,
                      ),
                      _buildRememberMeCheckbox(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildLoginBtn(),
                      SizedBox(
                        height: 40,
                      ),
                      _buildIcon()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
