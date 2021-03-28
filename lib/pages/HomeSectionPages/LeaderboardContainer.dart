import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LeaderBoardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
          child: Text('Leaderboard',
              style:
                  GoogleFonts.lora(fontSize: 30, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.network(
            'https://cdn.pixabay.com/photo/2013/07/13/12/41/cup-160117_960_720.png',
            height: 100,
            width: 200,
          ),
        ),
        //todo:1st person
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: HexColor('#b3b3b3'), width: 1))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 30, 0, 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1579503841516-e0bd7fca5faa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80'),
                    maxRadius: 23,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 20, 60, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tania Smith',
                        style: GoogleFonts.lora(fontSize: 18),
                      ),
                      Text(
                        'Chandigarh',
                        style: GoogleFonts.lora(fontSize: 13),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 12, 0),
                    child: Text('#1',
                        style: GoogleFonts.lora(
                            fontSize: 18, fontWeight: FontWeight.bold)))
              ],
            )
          ]),
        ),
        //todo 2nd person
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: HexColor('#b3b3b3'), width: 1))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 30, 0, 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80'),
                    maxRadius: 23,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 20, 60, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Evelin Jolie',
                        style: GoogleFonts.lora(fontSize: 18),
                      ),
                      Text(
                        'Banglore',
                        style: GoogleFonts.lora(fontSize: 13),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 12, 0),
                    child: Text('#2',
                        style: GoogleFonts.lora(
                            fontSize: 18, fontWeight: FontWeight.bold)))
              ],
            )
          ]),
        ),
        //todo 3rd person
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: HexColor('#fff'), width: 1))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 30, 0, 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80'),
                    maxRadius: 23,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 20, 60, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rohit Gupta',
                        style: GoogleFonts.lora(fontSize: 18),
                      ),
                      Text(
                        'Delhi',
                        style: GoogleFonts.lora(fontSize: 13),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 12, 0),
                    child: Text('#3',
                        style: GoogleFonts.lora(
                            fontSize: 18, fontWeight: FontWeight.bold)))
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
