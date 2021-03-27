import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class RedemptionScreen extends StatefulWidget {
  final String whichCoupon;
  RedemptionScreen(this.whichCoupon);
  @override
  _RedemptionScreenState createState() => _RedemptionScreenState();
}

class _RedemptionScreenState extends State<RedemptionScreen> {
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
                style:
                    GoogleFonts.lora(fontSize: 26, fontWeight: FontWeight.w300),
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
        backgroundColor: HexColor('#32a852'),
      ),
      body: Center(
          child: Container(child: Text(widget.whichCoupon + "is selected"))),
    );
  }
}
