import 'package:flutter/material.dart';
import 'package:trashcash_home/notification/mainpage.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationPage'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.green),
        child: Notifications(),
      ),
    );
  }
}
