import 'package:flutter/material.dart';
import 'package:inkpool/Participants/cannotSubmit.dart';
import 'package:inkpool/loading.dart';
import 'package:inkpool/services/database.dart';
import 'package:inkpool/utils/bottomsheet.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String blogName = "";
  String category = "";
  String subTime = "";
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Database().getUser(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Loading();
              if (snapshot.data['submitted']=='TRUE') return CannotSubmit();
              if(snapshot.data['round']==1 || snapshot.data['round']==2)
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                            child: Row(
                          children: [
                            BottomSheetIP(),
                            Padding(
                              padding: const EdgeInsets.only(left: 85.0),
                              child: Text(
                                "Dashboard",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                    fontSize: 25,
                                    fontFamily: 'Merriweather'),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Welcome, " + snapshot.data['name'],
                          style: TextStyle(
                              fontFamily: 'Sora',
                              color: Colors.blueGrey[200],
                              fontSize: 25),
                        ),
                      ),

                      //Round will be shown from DataBase
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          "You are Currently in Round-" +
                              snapshot.data['round'].toString(),
                          style: TextStyle(fontSize: 20, fontFamily: 'Sora'),
                        ),
                      ),
                      if(snapshot.data['round']==2)
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          "Your Topic is-\n\n" +
                              snapshot.data['topicRound2'].toString(),
                          style: TextStyle(fontSize: 20, fontFamily: 'Sora'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Card(
                          elevation: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Name - ' + snapshot.data['name'],
                              ),
                              style: TextStyle(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Card(
                          elevation: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Your Blog Name",
                              ),
                              style: TextStyle(),
                              onChanged: (value) {
                                setState(() {
                                  blogName = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Card(
                          elevation: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Your Preference (For/Against)",
                              ),
                              style: TextStyle(),
                              onChanged: (value) {
                                setState(() {
                                  category = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Card(
                          elevation: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Your Submission Time",
                              ),
                              style: TextStyle(),
                              keyboardType: TextInputType.datetime,
                              onChanged: (value) {
                                setState(() {
                                  subTime = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: RaisedButton(
                          onPressed: () {
                            Map<String, dynamic> data = {
                              'blogName': blogName,
                              'category': category,
                              'timeOfUpload': subTime,
                              'submitted': 'TRUE',
                            };
                            Database().submitRound1(data);
                            print('submitted');
                          },
                          elevation: 10.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontFamily: 'Merriweather',
                                color: Colors.blueGrey[200]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Note: Please submit your details as soon as you have submintted your Blog and kindly submit you blog during your category slot.",
                          style: TextStyle(
                              color: Colors.blueGrey[200],
                              fontFamily: 'Merriweather',
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              );
              if(snapshot.data['round']==3)
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                            child: Row(
                          children: [
                            BottomSheetIP(),
                            Padding(
                              padding: const EdgeInsets.only(left: 85.0),
                              child: Text(
                                "Dashboard",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                    fontSize: 25,
                                    fontFamily: 'Merriweather'),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Welcome, " + snapshot.data['name'],
                          style: TextStyle(
                              fontFamily: 'Sora',
                              color: Colors.blueGrey[200],
                              fontSize: 25),
                        ),
                      ),

                      //Round will be shown from DataBase
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          "You are Currently in Round-" +
                              snapshot.data['round'].toString(),
                          style: TextStyle(fontSize: 20, fontFamily: 'Sora'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 200.0),
                        child: Text(
                          "Your Current Line is -\n\n" +
                              snapshot.data['line'].toString(),
                          style: TextStyle(fontSize: 20, fontFamily: 'Sora'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
