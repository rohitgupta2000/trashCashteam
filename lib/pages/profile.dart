import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
                   automaticallyImplyLeading: false,

        ),
        body: Container(decoration: BoxDecoration(color: Colors.purpleAccent)));
  }
}
