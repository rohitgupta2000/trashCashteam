import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:trashcash_home/mediaQuery/sizers_helpers.dart';

class Design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.99,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: FlipCard(
        direction: FlipDirection.VERTICAL,
        front: Image.asset('assets/coupons/3_front.PNG'),
        back: Image.asset('assets/coupons/3_back.PNG'),
      ),
    );
  }
}
