import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trashcash_home/pages/Coupons/DifferentCoupons/1_clothing.dart';
import 'package:trashcash_home/pages/Coupons/DifferentCoupons/2_drinks.dart';
import 'package:trashcash_home/pages/Coupons/DifferentCoupons/3_design.dart';
import 'package:trashcash_home/pages/Coupons/DifferentCoupons/4_hotel.dart';
import 'package:trashcash_home/pages/Coupons/DifferentCoupons/5_salon.dart';
import 'package:trashcash_home/pages/Coupons/DifferentCoupons/6_relaxation.dart';

class Coupon extends StatefulWidget {
  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 0, 5),
                child: Text(
                  'Coupons',
                  style: GoogleFonts.lora(
                      fontSize: 26, fontWeight: FontWeight.w300),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 25,
                        width: 25,
                        child: Image.asset('assets/coins.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                    child: Text(
                      '5859',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          )),
          backgroundColor: HexColor('#007965'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Clothing(),
                Drinks(),
                Design(),
                Hotel(),
                Salon(),
                Relaxation()
              ],
            ),
          ),
          color: Colors.green[100],
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [HexColor('#85D8CE'), HexColor('#085078')])),
        ));
  }
}
// #005f6b
