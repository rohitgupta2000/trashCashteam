import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            //comment: this the quotation
            margin: EdgeInsets.fromLTRB(15, 20, 5, 10),
            child: Text(
                '“The greatest threat to our planet is the belief that someone else will save it.”',
                style: GoogleFonts.redressed(
                    fontSize: 18.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
          Container(
            child: Text('– Robert Swan, Author',
                style: GoogleFonts.redressed(fontSize: 15)),
          )
        ],
      ),
    );
  }
}
