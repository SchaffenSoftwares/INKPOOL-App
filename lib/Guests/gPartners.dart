import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inkpool/utils/bottomsheet.dart';
import 'package:inkpool/utils/gbottomsheet.dart';

void main()
{
  runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        home: GPartners(),
      )
  );
}

class GPartners extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Row(
                            children: [
                              GBottomSheetIP(),
                              Padding(
                                padding: const EdgeInsets.only(left: 73.0),
                                child: Text(
                                  "Our Partners",
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 50,right: 50),
                            child: RaisedButton(
                              onPressed: (){},
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                                child: Image(
                                  image: AssetImage('assets/sponsors/souledstore.jpg'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 50,right: 50),
                            child: RaisedButton(
                              onPressed: (){},
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                                child: Image(
                                  image: AssetImage('assets/sponsors/expertrons.png'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 50,right: 50, bottom: 20.0),
                            child: RaisedButton(
                              onPressed: (){},
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                                child: Image(
                                  image: AssetImage('assets/sponsors/cakecity.png'),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ]
                )
            )
        )
    );
  }
}
