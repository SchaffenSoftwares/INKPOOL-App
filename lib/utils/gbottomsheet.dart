import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inkpool/Guests/gPartners.dart';
import 'package:inkpool/Guests/gPrizes.dart';
import 'package:inkpool/Guests/gSchaffenAbout.dart';
import 'package:inkpool/Guests/gSponsors.dart';
import 'package:inkpool/Guests/gTimeline.dart';
import 'package:inkpool/Guests/gabout.dart';
import 'package:inkpool/Participants/ranking.dart';
import 'package:inkpool/login/landing.dart';
import 'package:inkpool/services/helper.dart';
import 'package:inkpool/services/userdata.dart';
import 'package:inkpool/wrapper.dart';

class GBottomSheetIP extends StatelessWidget {
  UserData userData = UserData();
  int val;

  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.dehaze),
      color: Colors.blueGrey[200],
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.blueGrey[700],
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            context: context,
            builder: (context) {
              return ListView(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Timeline of Event",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.calendarTimes,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GTimeline(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "About INK-POOL",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.questionCircle,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GAbout(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Ranking",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Ranking(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Our Partners",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.peopleArrows,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GPartners(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Our Sponsors",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.moneyBill,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GSponsors(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "INK-POOL Prizes",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.gifts,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GPrizes(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "About Schaffen",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.bookmark,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GSchaffenAbout(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Landing Page",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          color: Colors.blueGrey[200]),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.doorOpen,
                      color: Colors.blueGrey[200],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Landing(),
                      ));
                    },
                  ),
                ],
              );
            });
      },
    );
  }
}
