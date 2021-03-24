import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
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



    AuthMethods authMethods=new AuthMethods();

signMeOut() async{
   authMethods.signOut();
           await    HelperFunctions.saveuserLoggedInSharedPreference(false);
            //  await   HelperFunctions.saveUserEmailSharedPreference("");
            //  await HelperFunctions.saveUserNameSharedPreference("");
       

               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
}
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: Column(
        children: [
          ProfilePic(),
          Container(
           // padding: EdgeInsets.only(bottom:5),
            child: Text("${constants.myNAme.substring(0,1).toUpperCase()}"+
            "${constants.myNAme.substring(1,constants.myNAme.length)}"
             ,
             style: GoogleFonts.redressed(
                        fontSize: 25,
                        // backgroundColor: Colors.red,
                       // letterSpacing: -1.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
            ),
          ),
          SizedBox(height: 2),
          ProfileMenu(
            icon: "assets/privacy.svg",
            text: "Privacy",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/scroll.svg",
            text: "History",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/customer-support.svg",
            text: "Help & Support",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/settings.svg",
            text: "Settings",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/logout.svg",
            text: "Log Out",
            press: () { signMeOut();
              
            },
          ),
        ],
      ),
    );
  }
}
