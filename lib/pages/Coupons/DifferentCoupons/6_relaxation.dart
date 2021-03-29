import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trashcash_home/mediaQuery/sizers_helpers.dart';

import '../redemptionScreen.dart';

class Relaxation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.99,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: FlipCard(
        direction: FlipDirection.VERTICAL,
        front: Image.asset('assets/coupons/6_front.PNG'),
        back: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RedemptionScreen(
                        'assets/coupons/6_front.PNG',
                        'assets/coupons/006_couponBg.png',
                        HexColor('#007965'))));
          },
          child: Container(child: Image.asset('assets/coupons/6_back.PNG')),
        ),
      ),
    );
  }
}
