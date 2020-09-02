import 'package:flutter/material.dart';
import 'package:inkpool/utils/bottomsheet.dart';

import '../loading.dart';

class Ranking extends StatefulWidget {
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            //stream: Database().getUser(),
            builder: (context, snapshot) {
              //if (!snapshot.hasData) return Loading();
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
                                "Ranking",
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
                      

                      //Round will be shown from DataBase
                                         ],
                  ),
                ),
              );
            }));

  }
}
