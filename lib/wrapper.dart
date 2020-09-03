import 'package:flutter/material.dart';
import 'package:inkpool/Participants/dashboard.dart';
import 'package:inkpool/login/landing.dart';
import 'package:inkpool/login/login.dart';
import 'package:inkpool/services/helper.dart';
import 'package:inkpool/utils/common.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  ready() async {
    isLoggedIn = await HelperFunc.getUserloggedIn();
    username = await HelperFunc.getUsername();
    setState(() {});
  }

  @override
  void initState() {
    ready();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) return Landing();
    if (isLoggedIn) {
      return Dashboard();
    } else {
      return Landing();
    }
  }
}