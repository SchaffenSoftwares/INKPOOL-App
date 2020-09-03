import 'package:flutter/material.dart';
import 'package:inkpool/Guests/gTimeline.dart';

import 'login.dart';

void main()
{
  runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        home: Landing(),
      )
  );
}

class Landing extends StatelessWidget
{
  Widget build(BuildContext context)
  {
     return Scaffold(
       body: Container(
         child: Padding(
           padding: const EdgeInsets.only(top: 80.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 20.0),
                   child: Image(
                     image: AssetImage('assets/landing.png'),
                     width: 370,
                   ),
                 ),
               ),
               Container(
                 child: Center(
                   child: Padding(
                     padding: const EdgeInsets.only(bottom: 320),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(bottom: 5.0),
                           child: RaisedButton(
                             padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20, left: 20),
                             color: Colors.white,
                             onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
                             },
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             elevation: 10.0,
                             child: Text(
                                 "Login as a Participant",
                               style: TextStyle(
                                 color: Colors.blueGrey[200],
                                 fontFamily: 'Sora',
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18.0
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 5.0),
                           child: RaisedButton(
                             padding: EdgeInsets.only(left: 42,right: 42,bottom: 10.0,top: 10.0),
                             color: Colors.white,
                             onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => GTimeline(),));
                             },
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             elevation: 10.0,
                             child: Text(
                               "Login as a Guest",
                               style: TextStyle(
                                   color: Colors.blueGrey[200],
                                   fontFamily: 'Sora',
                                 fontSize: 18.0,
                                 fontWeight: FontWeight.bold
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
  }
}