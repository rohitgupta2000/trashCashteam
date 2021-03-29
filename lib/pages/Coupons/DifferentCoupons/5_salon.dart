import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trashcash_home/mediaQuery/sizers_helpers.dart';
import 'package:trashcash_home/pages/Coupons/redemptionScreen.dart';

class Salon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.99,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: FlipCard(
        direction: FlipDirection.VERTICAL,
        front: Image.asset('assets/coupons/5_front.PNG'),
        back: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RedemptionScreen(
                        'assets/coupons/5_front.PNG',
                        'assets/coupons/005_couponBg.png',
                        HexColor('#8f4068'))));
          },
          child: Container(child: Image.asset('assets/coupons/5_back.PNG')),
        ),
      ),
    );
  }
}
