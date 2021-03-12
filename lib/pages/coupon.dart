import 'package:flutter/material.dart';

class Coupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CouponPage'),
        ),
        body: Container(decoration: BoxDecoration(color: Colors.orangeAccent)));
  }
}
