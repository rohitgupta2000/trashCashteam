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
            child: Text('“The greatest threat to our planet is the belief”',
                style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
          Text("that someone else will save it.",
              style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text('– Robert Swan, Author',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
