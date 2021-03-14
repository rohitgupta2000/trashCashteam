
import 'package:flutter/material.dart';
import 'home.dart';




class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // toolbarHeight: 50,
        //backgroundColor: Colors.black,
        title:  Text("Profile",),
      
      
      ),
      body: Home(),
    );
  }
}
