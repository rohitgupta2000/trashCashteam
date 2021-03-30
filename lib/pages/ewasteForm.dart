import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/pages/addressPage.dart';
import 'package:trashcash_home/pages/orders.dart';
import 'package:trashcash_home/services/database.dart';

class EwasteForm extends StatelessWidget {
  final String apptitle;
  EwasteForm(this.apptitle);
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   

  //  DatabaseMethods databaseMethods = new DatabaseMethods();
   // TextEditingController brandController = new TextEditingController();
    TextEditingController detailsController = new TextEditingController();
    TextEditingController descriptionController = new TextEditingController();

    sendOrderDetails() async {
      if (formKey.currentState.validate()) {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Address(
                   // brandController.text,
                    detailsController.text,
                    descriptionController.text,
                    apptitle)));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(apptitle),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
               Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(top:15),

                              width: MediaQuery.of(context).size.width/2,
                              decoration: BoxDecoration(color: Colors.green[200],
                              borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("Details",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),),
                            ),
              SizedBox(
                height: 10,
              ),
            //   TextFormField(
            //     validator: (val) {
            //       if (val != "")
            //         return null;
            //       else
            //         return "Input is required";
            //     },
            //     textAlign: TextAlign.center,
            //     maxLines: 2,
            //  //   controller: brandController,
            //     decoration: InputDecoration(
            //       hintText: "Brand*",
            //     ),
            //   ),
              SizedBox(height: 2),
              // Container(
              //   alignment: Alignment.topLeft,
              //   child: Text("Enter the details"),
              // ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
             //   margin: EdgeInsets.fromLTRB(153, 5, 0, 5),
                child: Text("Enter the Details",style:TextStyle(fontSize: 18)),
              ),
              TextFormField(
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                controller: detailsController,
                maxLength: 80,
                maxLines: 3,
                decoration: InputDecoration(hintText: "Details*"),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(55, 5, 0, 5),
                child:
                    Text("Include condition,features and reason for selling",style:TextStyle(fontSize: 15)),
              ),
              TextFormField(
                controller: descriptionController,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                maxLength: 4000,
                maxLines: 3,
                decoration:
                    InputDecoration(hintText: "Describe what you are selling*"),
              ),
              // SizedBox(height: 2),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 50,
                width: 200,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    sendOrderDetails();
                  },
                  label: Text(
                    "Continue",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(top:20),
              //   width: 100,
              //   height: 30,
              //   child: Text(
              //     "Continue",
              //     style: TextStyle(fontSize: 24),
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.green,
              //   ),
              //   alignment: Alignment.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
