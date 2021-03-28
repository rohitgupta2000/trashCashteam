import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:trashcash_home/pages/ewaste.dart';

class Sell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            LineAwesomeIcons.times,
            size: 30,
            color: Colors.black,
          ),
          title: Text(
            'What are you offering?',
            style: GoogleFonts.poppins(fontSize: 23, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
<<<<<<< HEAD
        body: Container(decoration: BoxDecoration(color: Colors.white)));
=======
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(color: HexColor('#eee')),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            children: [
              //comment: this is the e-waste
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Ewaste()));},
                              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: new Border.all(
                          color: Colors.grey[400],
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.all(new Radius.circular(5)),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          offset: new Offset(0, 0.1),
                          blurRadius: 0.1,
                        )
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Image.asset(
                          'assets/001-ewaste.png',
                          height: 70,
                          width: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text('E-waste',
                            style: GoogleFonts.lato(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
              ),
              //comment: this is the newspaper
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Colors.grey[400],
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0, 0.1),
                        blurRadius: 0.1,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Image.asset(
                        'assets/002-newspaper.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Text('Newspapers',
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              //comment: this is the plastic waste
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Colors.grey[400],
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0, 0.1),
                        blurRadius: 0.1,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Image.asset(
                        'assets/003-plastic.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text('Plastics',
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              //comment: this is the cardbaord
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Colors.grey[400],
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0, 0.1),
                        blurRadius: 0.1,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Image.asset(
                        'assets/004-box.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text('Cardboards',
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              //comment: this is the metal waste
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Colors.grey[400],
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0, 0.1),
                        blurRadius: 0.1,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Image.asset(
                        'assets/005-metal.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text('Metals',
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              //comment: this the glassware
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Colors.grey[400],
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0, 0.1),
                        blurRadius: 0.1,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Image.asset(
                        'assets/006-glass.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text('Glasswares',
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              //comment: this is the wires
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Colors.grey[400],
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0, 0.1),
                        blurRadius: 0.1,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Image.asset(
                        'assets/007-wiring.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text('Wires',
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              //comment: this is the more
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Colors.grey[400],
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0, 0.1),
                        blurRadius: 0.1,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Image.asset(
                        'assets/008-grid.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      child: Text('More ',
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
>>>>>>> main
  }
}
