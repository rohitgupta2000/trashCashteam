import 'package:flutter/material.dart';
import 'home.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        // toolbarHeight: 50,
        //backgroundColor: Colors.black,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Home(),
    );
  }
}
