import 'package:flutter/material.dart';
import 'package:inkpool/utils/bottomsheet.dart';

class CannotSubmit extends StatefulWidget {
  @override
  _CannotSubmitState createState() => _CannotSubmitState();
}

class _CannotSubmitState extends State<CannotSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center
      (
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Row(
              children: [
                BottomSheetIP(),
              ],
            ),
            SizedBox(height: 300,),
            Text
            (
              'Submitted Successfully!\n\nCannot Submit Again!',
              style: TextStyle
              (
                fontSize: 20),
              ),
          ],
        ),
        ),
    );
  }
}
