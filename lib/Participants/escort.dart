import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inkpool/utils/bottomsheet.dart';

void main()
{
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Escort(),
    )
  );
}

class Escort extends StatelessWidget
{

  final databaseReference = Firestore.instance;

  void getData() {
    databaseReference
        .collection("Participants")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }



  Widget build(BuildContext context)
  {
    return Scaffold(
      body: StreamBuilder(
         stream: Firestore.instance.collection('Participant').document('Dhiransh').snapshots(),

        builder: (context, snapshot){
           if(!snapshot.hasData)
             return Text("Loading, Please Wait");
           return Container(
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

                             "Your Escort",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: Colors.blueGrey[200],
                                 fontSize: 25,
                                 fontFamily: 'Merriweather'
                             ),
                           ),
                         ),

                       ],
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 20.0),
                   child: Card(
                     elevation: 20.0,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)
                     ),
                     child: Container(
                         height: 430,
                         width: 350,
                         color: Colors.blueGrey[700],
                         child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 20.0),
                               child: CircleAvatar(
                                 radius: 70.0,
                                 child: Image(
                                   image: AssetImage('assets/1escort.jpeg'),
                                 ),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 30.0),
                               child: Container(
                                 child: Text(
                                   "Personal Information",
                                   style: TextStyle(
                                       fontFamily: 'Merriweather',
                                       fontSize: 30
                                   ),
                                 ),
                               ),
                             ),
                             Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 25.0, top: 45),
                                   child: Container(
                                     child: Text(
                                       "Name :",
                                       style: TextStyle(
                                           color: Colors.blueGrey[200],
                                           fontSize: 18.0,
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Merriweather'
                                       ),
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 5.0, top: 45),
                                   child: Container(
                                     child: Text(
                                       "Sakshi Saxena",
                                       style: TextStyle(
                                           color: Colors.blueGrey[200],
                                           fontSize: 18.0,
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Sora'
                                       ),
                                     ),
                                   ),
                                 ),

                               ],
                             ),
                             Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 25.0, top: 25),
                                   child: Container(
                                     child: Text(
                                       "E-Mail :",
                                       style: TextStyle(
                                           color: Colors.blueGrey[200],
                                           fontSize: 18.0,
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Merriweather'
                                       ),
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 5.0, top: 25),
                                   child: Container(
                                     child: Text(
                                       "sakshi0808@gmail.com",
                                       style: TextStyle(
                                           color: Colors.blueGrey[200],
                                           fontSize: 18.0,
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Sora'
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 25.0, top: 25),
                                   child: Container(
                                     child: Text(
                                       "Contact No. :",
                                       style: TextStyle(
                                           color: Colors.blueGrey[200],
                                           fontSize: 18.0,
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Merriweather'
                                       ),
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 5.0, top: 25),
                                   child: Container(
                                     child: Text(
                                       "9454047774",
                                       style: TextStyle(
                                           color: Colors.blueGrey[200],
                                           fontSize: 18.0,
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Sora'
                                       ),
                                     ),
                                   ),
                                 ),

                               ],
                             ),
                           ],
                         )
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 20.0),
                   child: Card(
                     color: Colors.blueGrey[700],
                     elevation: 20,
                     child: Container(
                       width: 350,
                       height: 100,
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(top: 14.0),
                             child: Text(
                               "For Any Other Queries",
                               style: TextStyle(
                                   fontFamily: 'Merriweather',
                                   fontSize: 25
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 15.0,),
                             child: Text(
                               "Mail Us At : info@schaffensofts.com",
                               style: TextStyle(
                                 fontSize: 18,
                                 color: Colors.blueGrey[200],
                                 fontWeight: FontWeight.bold,
                                 fontFamily: 'Sora',
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                   ),
                 ),
                 RaisedButton(
                   onPressed: (){
                     getData();
                   },
                   child: Text("try"),
                 ),
               ],
             ),
           );
        },
      ),
    );
  }
}