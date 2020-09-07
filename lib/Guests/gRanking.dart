import 'package:flutter/material.dart';
import 'package:inkpool/services/database.dart';
import 'package:inkpool/utils/gbottomsheet.dart';

import '../loading.dart';

class GRanking extends StatefulWidget {
  @override
  _GRankingState createState() => _GRankingState();
}

class _GRankingState extends State<GRanking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Database().getRound(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Loading();
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                            child: Row(
                          children: [
                            GBottomSheetIP(),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          "Round- " + snapshot.data['round'].toString(),
                          style: TextStyle(fontSize: 20, fontFamily: 'Sora'),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      if (snapshot.data['round'] == '1' ||
                          snapshot.data['round'] == '3')
                        StreamBuilder(
                            stream: Database()
                                .getRanking(snapshot.data['round'].toString()),
                            builder: (context, snapshot2) {
                              return Column(
                                children: <Widget>[
                                  for (int i = 0;
                                      i < snapshot2.data.documents.length;
                                      i++)
                                    Container(
                                      margin: EdgeInsets.all(10.0),
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text((i + 1).toString() + '. '),
                                          Spacer(),
                                          Text(snapshot2.data.documents[i]
                                              ['name']),
                                          Spacer()
                                        ],
                                      ),
                                    )
                                ],
                              );
                            }),
                      if (snapshot.data['round'] == '2')
                        Column(
                          children: [
                            for (int j = 1; j <= 12; j++)
                              StreamBuilder(
                                  stream: Database().getPoolRanking(j),
                                  builder: (context, snapshot2) {
                                    if (!snapshot2.hasData) return Container();
                                    return Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50.0),
                                          child: Text(
                                            "Pool- " + j.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Sora'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        for (int i = 0;
                                            i < snapshot2.data.documents.length;
                                            i++)
                                          Container(
                                            margin: EdgeInsets.all(10.0),
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text((i + 1).toString() + '. '),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(snapshot2.data.documents[i]
                                                    ['name'])
                                              ],
                                            ),
                                          )
                                      ],
                                    );
                                  }),
                          ],
                        )
                    ],
                  ),
                ),
              );
            }));

  }
}