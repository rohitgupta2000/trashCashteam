import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:trashcash_home/pages/HomeSectionPages/LeaderboardContainer.dart';
import 'package:trashcash_home/pages/HomeSectionPages/LocationTextField.dart';
import 'package:trashcash_home/pages/HomeSectionPages/QuotationContainer.dart';
import 'package:trashcash_home/pages/HomeSectionPages/UserProfile.dart';

class TrashCashHome extends StatefulWidget {
  @override
  _TrashCashHomeState createState() => _TrashCashHomeState();
}

class _TrashCashHomeState extends State<TrashCashHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //comment: main container
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //comment: image design and padding for the green container
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: const EdgeInsets.only(bottom: 80, top: 50),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                color: HexColor('#00806d'),
              ),
              child: Column(
                children: [
                  //comment: UserProfile
                  UserProfile(),
                  //comment: locationTextField
                  LocationTextField(),
                  //comment: quotation container
                  QuotationContainer()
                ],
              ),
            ),
            //comment: leaderboard Container
            LeaderBoardContainer(),
          ],
        ),
      ),
    );
  }
}
