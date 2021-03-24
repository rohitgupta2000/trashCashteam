import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trashcash_home/mediaQuery/sizers_helpers.dart';
import 'package:trashcash_home/pages/Coupons/redemptionScreen.dart';
import 'package:trashcash_home/profilePage/profile_screen.dart';

class Clothing extends StatelessWidget {
  String string="Clothing";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.99,
      // height: 215,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: FlipCard(
        direction: FlipDirection.VERTICAL,
        front: Image.asset('assets/coupons/1_front.PNG'),
        back: GestureDetector(
          onDoubleTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> RedemptionScreen(string)));
          } ,
                  child: Container
          (child: Image.asset('assets/coupons/1_back.PNG')),
        ),
      ),
    );
  }
}
