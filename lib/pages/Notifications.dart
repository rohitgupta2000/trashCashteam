import 'package:flutter/material.dart';
import 'package:trashcash_home/notification/mainpage.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.green),
        child: Notifications(),
      ),
    );
  }
}
