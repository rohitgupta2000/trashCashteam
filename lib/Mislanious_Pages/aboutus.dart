import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

class Aboutus extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:50),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          
          bottomNavigationBar: ContactUsBottomAppBar(
            
            companyName: 'Trash Cash',
            textColor: Colors.black,
            backgroundColor: Colors.white10,
            email: 'TrashCash.Team@gmail.com',
            // textFont: 'Sail',
          ),
          backgroundColor: Colors.white,
          body: ContactUs(
              cardColor: Colors.white,
              textColor: Colors.black,
              // logo: AssetImage('images/logo.png'),
              email: ' TrashCash.Team@gmail.com',
              companyName: 'Trash Cash',
              companyColor: Colors.black,
              phoneNumber: '+91 7978578168',
              website: 'https://www.TrashCash.com',
               
              tagLine: 'Lets Recycle',
              taglineColor: Colors.black,
              twitterHandle: 'CashTrash',
              instagram: 'CashTrash',
              facebookHandle: 'CashTrash'),
        ),
      ),
    );
  }
}

