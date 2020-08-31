import 'package:flutter/material.dart';
import 'package:inkpool/utils/bottomsheet.dart';

void main()
{
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    )
  );
}

class Dashboard extends StatelessWidget
{
  Widget build(BuildContext context)
  {

    return Scaffold(
      body: Container(
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
                                    fontFamily: 'Merriweather'
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                        "Welcome, Dhiransh",
                      style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.blueGrey[200],
                        fontSize: 25
                      ),
                    ),
                  ),

                  //Round will be shown from DataBase
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                        "You are Currently in Round-1",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Sora'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Card(
                      elevation: 10.0,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Name",
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Blog Name",
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Category",
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Submission Time",
                          ),
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: RaisedButton(
                      onPressed: ()
                      {},
                      elevation: 10.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      child: Text(
                          "SUBMIT",
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          color: Colors.blueGrey[200]
                        ),
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
                        fontSize: 16
                      ),
                    ),
                  )
                ],
              ),
            ),
        )
    );
  }
}