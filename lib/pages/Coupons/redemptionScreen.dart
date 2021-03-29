import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:trashcash_home/mediaQuery/sizers_helpers.dart';

class RedemptionScreen extends StatefulWidget {
  final String frontCoupon;
  final String backgroundCoupon;
  final Color colors;
  RedemptionScreen(this.frontCoupon, this.backgroundCoupon, this.colors);

  @override
  _RedemptionScreenState createState() => _RedemptionScreenState();
}

class _RedemptionScreenState extends State<RedemptionScreen> {
  TextEditingController numberController = new TextEditingController();
  int _n = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
            child: Text(
              'Redeem',
              style: GoogleFonts.lora(
                fontSize: 33,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.backgroundCoupon),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: displayHeight(context) * 0.13,
                ),
                child: Column(
                  children: [
                    //comment: this is no. of points earned
                    Text(
                      '45,390',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                      child: Text(
                        'Total points earned',
                        style:
                            GoogleFonts.lora(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    //comment: this is coupon image
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(widget.frontCoupon,
                          width: displayWidth(context) * 0.90),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: displayWidth(context) * 0.36),
                              child: SizedBox(
                                height: 30,
                                child: new FloatingActionButton(
                                  onPressed: (() {
                                    setState(() {
                                      if (_n != 1) _n--;
                                    });
                                  }),
                                  child: new Icon(
                                    LineAwesomeIcons.minus,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              )),
                          Text(
                            '$_n',
                            style: new TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                            child: new FloatingActionButton(
                              onPressed: (() {
                                setState(() {
                                  _n++;
                                });
                              }),
                              child: new Icon(
                                LineAwesomeIcons.plus,
                                color: Colors.black,
                                size: 20,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
                      child: ElevatedButton(
                        onPressed: (() {}),
                        child: Text(
                          'REDEEM NOW',
                          style: GoogleFonts.nunitoSans(fontSize: 22),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 12)),
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all(widget.colors),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
