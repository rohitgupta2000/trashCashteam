//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
import 'package:trashcash_home/notification/notificationtile.dart';
import 'package:trashcash_home/services/database.dart';

//what kinds of notification?
//Rohit,your order has been placed
//Rohit,your profile has been updated
//Rohit, new vouchers has been added
//Rohit, your order will be picked up by our agent by somedate

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Stream notificationStream;
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Widget notificationList() {
    return StreamBuilder(
      stream: notificationStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return NotificationTile(
                      snapshot.data.docs[index].data()["email"].toString(),
                      " is on TrashCash, ask them to donate some money");

                  //  snapshot.data.docs[index].data()["message"],snapshot.data.docs[index].data()["sendBy"]==Constants.myNAme);
                },
              )
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    constants.myNAme = await HelperFunctions.getUserNameSharedPreference();
    databaseMethods.getUsers().then((value) {
      setState(() {
        notificationStream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return notificationList();
    // Container(
    //   child: NotificationTile(constants.myNAme," profile has been updated"),

    // );
  }
}
