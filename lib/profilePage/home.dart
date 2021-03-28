import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trashcash_home/Mislanious_Pages/aboutus.dart';
import 'package:trashcash_home/Mislanious_Pages/help.dart';
import 'package:trashcash_home/Mislanious_Pages/setting.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
import 'package:trashcash_home/pages/history.dart';
import 'package:trashcash_home/pages/orders.dart';
import 'package:trashcash_home/services/auth.dart';
import 'package:trashcash_home/views/mainpage.dart';
import 'profile_menu.dart';
import 'profilepic.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AuthMethods authMethods = new AuthMethods();

    signMeOut() async {
      authMethods.signOut();
      await HelperFunctions.saveuserLoggedInSharedPreference(false);
      //  await   HelperFunctions.saveUserEmailSharedPreference("");
      //  await HelperFunctions.saveUserNameSharedPreference("");

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfilePic(),
              Container(
                // padding: EdgeInsets.only(bottom:5),
                child: Text(
                  "${constants.myNAme.substring(0, 1).toUpperCase()}" +
                      "${constants.myNAme.substring(1, constants.myNAme.length)}",
                  style: GoogleFonts.lora(
                    fontSize: 25,
                    // backgroundColor: Colors.red,
                    // letterSpacing: -1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
<<<<<<< HEAD
            ),
          
          SizedBox(height: 2),
          ProfileMenu(
            icon: "assets/privacy.svg",
            text: "About us",
            press: () {
              Navigator.push (context, MaterialPageRoute(builder: (context) => Aboutus ()),);
            },
          ),
          ProfileMenu(
            icon: "assets/scroll.svg",
            text: "History",
            press: () {
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => History()));  

            },
          ),
          ProfileMenu(
            icon: "assets/customer-support.svg",
            text: "Help & Support",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => help()),);

            },
          ),
          ProfileMenu(
            icon: "assets/settings.svg",
            text: "Settings",
            press: () {
               Navigator.push (context, MaterialPageRoute(builder: (context) => settings()),);
            },
          ),
          ProfileMenu(
            icon: "assets/logout.svg",
            text: "Log Out",
            press: () {
              signMeOut();
            },
=======
              SizedBox(height: 2),
              ProfileMenu(
                icon: "assets/privacy.svg",
                text: "About us",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Aboutus()),
                  );
                },
              ),
              ProfileMenu(
                icon: "assets/scroll.svg",
                text: "History",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersPage()));
                },
              ),
              ProfileMenu(
                icon: "assets/customer-support.svg",
                text: "Help & Support",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => help()),
                  );
                },
              ),
              ProfileMenu(
                icon: "assets/settings.svg",
                text: "Settings",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => settings()),
                  );
                },
              ),
              ProfileMenu(
                icon: "assets/logout.svg",
                text: "Log Out",
                press: () {
                  signMeOut();
                },
              ),
            ],
>>>>>>> 08f0c4d243722c6fa47a61462be05c4ea1c41dcc
          ),
        ));
  }
}
