import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:trashcash_home/pages/SettingPage.dart';
import 'package:trashcash_home/pages/coupon.dart';
import 'package:trashcash_home/pages/profile.dart';
import 'package:trashcash_home/pages/sell.dart';
import './pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(TrashCash());
}

class TrashCash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TrashCash",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
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
    SettingPage(),
    Coupon(),
    Sell(),
    Profile()
  ];

  void onTappedBar(int ind) {
    setState(() {
      _currenIndex = ind;
      switch (ind) {
        case 0:
          {
            display = 'Home';
            color = HexColor('#dddddd');
          }
          break;
        case 1:
          {
            display = 'Coupon';
            color = Colors.teal;
          }
          break;
        case 2:
          {
            display = 'Sell';
            color = Colors.orangeAccent;
          }
          break;
        case 3:
          {
            display = 'Notification';
            color = Colors.brown;
          }
          break;
        case 4:
          {
            display = 'User';
            color = Colors.purpleAccent;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currenIndex],
      // appBar: AppBar(
      //   title: Text('TrashCash'),
      // ),
      // drawer: Drawer(
      //     child: ListView(
      //   children: const <Widget>[
      //     DrawerHeader(
      //       decoration: BoxDecoration(color: Colors.greenAccent),
      //       child: Text(
      //         'DrawerHeader',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 24,
      //         ),
      //       ),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.message),
      //       title: Text('Messages'),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.account_circle),
      //       title: Text('Profile'),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.settings),
      //       title: Text('Settings'),
      //     ),
      //   ],
      // )),
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
          Icon(LineAwesomeIcons.plus_circle, size: 40),
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
