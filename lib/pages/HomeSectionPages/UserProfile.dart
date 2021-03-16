import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trashcash_home/helper/constants.dart';
//import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
import 'package:trashcash_home/services/database.dart';


class UserProfile extends StatefulWidget {
  

//final DatabaseMethods databaseMethods=new DatabaseMethods();

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  //String name;
  @override
 
//   void initState() {
//      getUserName();
//     setState(() {
     
//     });
//      super.initState();
//   }
    
// getUserName() async{
//   constants.myNAme=await HelperFunctions.getUserEmailSharedPreference();

// }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    'Hello ,',
                    style: GoogleFonts.redressed(
                      fontSize: 20,
                      // backgroundColor: Colors.red,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#cdfffc'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 8),
                  child: Text( constants.myNAme !=null? constants.myNAme:"null",
                    //'Natasha Meher',
                    style: GoogleFonts.redressed(
                      fontSize: 25,
                      // backgroundColor: Colors.red,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1597248374161-426f0d6d2fc9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2000&q=80'),
              maxRadius: 20,
            ),
          )
        ]),
      ],
    );
  }
}
