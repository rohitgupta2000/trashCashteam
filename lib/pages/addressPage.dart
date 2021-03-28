import 'package:flutter/material.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/pages/orderPlaced.dart';
import 'package:trashcash_home/services/database.dart';

class Address extends StatelessWidget {

  final String details;
  final String description;
  final String category;
<<<<<<< HEAD
  Address(this.details,this.description,this.category);
 
    @override
=======
  Address(this.brand, this.details, this.description, this.category);

  @override
>>>>>>> 08f0c4d243722c6fa47a61462be05c4ea1c41dcc
  Widget build(BuildContext context) {
    DatabaseMethods databaseMethods = new DatabaseMethods();
    final formKey = GlobalKey<FormState>();
    TextEditingController emailcontroller = new TextEditingController();
    TextEditingController namecontroller = new TextEditingController();
    TextEditingController addresscontroller = new TextEditingController();
    TextEditingController pincontroller = new TextEditingController();
    TextEditingController citycontroller = new TextEditingController();
    TextEditingController statecontroller = new TextEditingController();
    TextEditingController numbercontroller = new TextEditingController();

    addOrderDetails() async {
      if (formKey.currentState.validate()) {
        Map<String, dynamic> orderMap = {
          "OrderByUsername": constants.myNAme,
<<<<<<< HEAD
          "Category":category,
          "details": details,
          "description": description,
          "Email":emailcontroller.text,
          "Full name":namecontroller.text,
          "Address":addresscontroller.text,
          "Pincode":pincontroller.text,
          "city":citycontroller.text,
          "state":statecontroller.text,
          "mobile number":numbercontroller.text,
=======
          "Category": category,
          "brand": brand,
          "details": details,
          "description": description,
          "Email": emailcontroller.text,
          "Full name": namecontroller.text,
          "Adress": addresscontroller.text,
          "Pincode": pincontroller.text,
          "city": citycontroller.text,
          "state": statecontroller.text,
          "mobile number": numbercontroller.text,
>>>>>>> 08f0c4d243722c6fa47a61462be05c4ea1c41dcc
          "time": DateTime.now().microsecondsSinceEpoch,
        };
        await databaseMethods.saveOrderDetails(orderMap, category);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OrderPlaced()));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Address")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(100, 5, 0, 5),
                child: Text(
                  "Enter Your Address",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailcontroller,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Email*",
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                controller: namecontroller,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Full Name*",
                ),
              ),
              TextFormField(
                controller: addresscontroller,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Address*",
                ),
              ),
              TextFormField(
                controller: pincontroller,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Pincode*",
                ),
              ),
              TextFormField(
                controller: citycontroller,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "City*",
                ),
              ),
              TextFormField(
                controller: statecontroller,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "State*",
                ),
              ),
              SizedBox(height: 2),

              TextFormField(
                controller: numbercontroller,
                validator: (val) {
                  if (val != "")
                    return null;
                  else
                    return "input is required";
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Mobile Number*",
                ),
              ),
              SizedBox(height: 2),
              // Container(
              //   alignment: Alignment.topLeft,
              //   child: Text("Enter the details"),
              // ),
              SizedBox(height: 10),

              // SizedBox(height: 2),

              SizedBox(
                height: 20,
              ),

              Container(
                height: 50,
                width: 150,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    addOrderDetails();
                  },
                  label: Text(
                    "Sell",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
