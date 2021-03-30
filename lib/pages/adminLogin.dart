import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trashcash_home/pages/adminPage/adminMain.dart';
import 'package:trashcash_home/views/login.dart';




class AdminLogin extends StatelessWidget {
   static final formKey1 = GlobalKey<FormState>();
   
  @override
   TextEditingController adminidcontroller=new TextEditingController();
  Widget build(BuildContext context) {
    checkingid(){
      if(formKey1.currentState.validate()){

       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyAdminHomePage()));
      
    }  }
    
    return Scaffold(
      body: SingleChildScrollView(
              child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/1.1,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              // even space distribution
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    
                    Text(
                      "TRASH CASH ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Container(
                  
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/welcome2.jpg"))),
                ),
                Form(
                  key: formKey1,
                                child: Column(
                    children: <Widget>[
                      TextFormField(
                         controller: adminidcontroller,
                         obscureText: true,
                              validator: (val) {
                                //the val is the value user input in the textfield
                                return  val!="adminrohit"
                                    ? "invalid Admin ID"
                                    : null;
                              },
                             
                              decoration: InputDecoration(
                                hintText: 'Admin ID*',
                                suffixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(height:20),

                      
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () { checkingid();
                          
                        
                        },
                        // defining the shape
                        color: Colors.lightGreen[600],

                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Enter as Admin",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      // creating the signup button
                    
                      

                     
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
