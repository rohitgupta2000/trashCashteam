import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class LocationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(3, 10, 3, 12),
      width: 285,
      height: 70,
      child: TextField(
        //comment: this the search location
        showCursor: false,
        cursorHeight: 25,
        decoration: InputDecoration(
            filled: false,
            fillColor: Colors.white10,
            prefixIcon: Icon(
              LineAwesomeIcons.map_marker,
              color: Colors.white60,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'H.no 2427, Sector37C, Changidarh ,160036 ',
            hintStyle: GoogleFonts.merriweather(
                fontSize: 16, color: HexColor('#ccf2f4'))),
      ),
    );
  }
}
