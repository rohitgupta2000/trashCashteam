import 'package:flutter/material.dart';
import 'package:trashcash_home/main.dart';
class OrderPlaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("order placed")),
      body: Center(
        child:
        Column(
          children: [
            Text("order has been placed"),
            Container(
                  height: 50,width: 350,
                  child: FloatingActionButton.extended(
                    onPressed: () { 
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    },
                   
                    label: Text("Back to Homepage",style: TextStyle(fontSize: 25),),
                  ),
                ),
          ],
        )
      ),
    );
  }
}