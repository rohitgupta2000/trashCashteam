import 'package:flutter/material.dart';
import 'package:trashcash_home/notification/notificationtile.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationTile("rohit"),
      
    );
  }
}
