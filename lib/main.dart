import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
//import 'package:trashcash_home/notification/mainpage.dart';
import 'package:trashcash_home/pages/Notifications.dart';
import 'package:trashcash_home/pages/coupon.dart';
//import 'package:trashcash_home/pages/profile.dart';
import 'package:trashcash_home/pages/sell.dart';
import 'package:trashcash_home/profilePage/profile_screen.dart';
import 'package:trashcash_home/views/mainpage.dart';
import './pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';

import 'helper/helperfunction.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase
      .initializeApp();
  runApp(TrashCash());
}



class TrashCash extends StatefulWidget {


  @override
  _TrashCashState createState() => _TrashCashState();
}


class _TrashCashState extends State<TrashCash> {
  
  bool isUserloggedIn=false;

  @override
  void initState() {                          //the first part to run when this page loads
    getLoggedInState();                       //takes time to get data from server..should not use await in init state so function is created
    super.initState();
  }
    getLoggedInState() async {

    await HelperFunctions.getUserLoggedInSharedPreference().then((value) { //this will return boolean value that isloggedin or not

      setState(() {                         //rebuilds the widget
        isUserloggedIn = value;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TrashCash",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: isUserloggedIn!=null?isUserloggedIn? HomePage(): MainPage():MainPage(),
      //HomePage(),
    );
  }
}

Color color = HexColor('#dddddd');
String display = '';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currenIndex = 0;
  final List<Widget> _children = [
     TrashCashHome(),
     Coupon(),
     Sell(),
     NotificationPage(),   
     ProfileScreen()
  ];

  void onTappedBar(int ind) {
    setState(() {
      _currenIndex = ind;
         });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currenIndex],

      backgroundColor: color,
      bottomNavigationBar: CurvedNavigationBar(
        index: _currenIndex,
        onTap: onTappedBar,
        backgroundColor: color,
        height: 56,
        items: [
          Icon(
            LineAwesomeIcons.home,
            size: 30,
          ),
          Icon(
            LineAwesomeIcons.rupee,
            size: 30,
          ),
          Icon(LineAwesomeIcons.plus_circle,
           size: 40),
          Icon(
            LineAwesomeIcons.bell,
            size: 30,
          ),
          Icon(
            LineAwesomeIcons.user,
            size: 30,
          ),
        ],
      ),
    );
  }
}

// HexColor('#B4B6B6'), HexColor('#2F604E')

//height: MediaQuery.of(context).size.height
