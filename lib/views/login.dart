import 'package:flutter/material.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
import 'package:trashcash_home/main.dart';
import 'package:trashcash_home/services/auth.dart';
import 'package:trashcash_home/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final formkey = GlobalKey<FormState>(); //to identify the form uniquely
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  QuerySnapshot snapshotUserInfo;
  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextEditingController passwordTextEditngController =
      new TextEditingController(); //to control the texts written in textfields
  TextEditingController emailTextEditngController = new TextEditingController();

  signIn() async {
    if (formkey.currentState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditngController.text);

      databaseMethods
          .getUserByUserEmail(emailTextEditngController.text)
          .then((val) {
        snapshotUserInfo = val;
        HelperFunctions.saveUserNameSharedPreference(
            snapshotUserInfo.docs[0].data()["name"]);
        // constants.myNAme= snapshotUserInfo.docs[0].data()["name"];
      });

      setState(() {
        isLoading = true; //showing the user the loading option
      });

      await authMethods
          .signInWithEmailAndPassword(
              emailTextEditngController.text, passwordTextEditngController.text)
          .then((val) {
        if (val != null) {
          HelperFunctions.saveuserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
              child: isLoading
            ? Container(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 0,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Login to your account",
                              style:
                                  TextStyle(fontSize: 17.0, color: Colors.black),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Image.asset(
                            'assets/trashcashlogo.png',
                            height: 180,
                            width: 550,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: emailTextEditngController,
                                  validator: (val) {
                                    return RegExp(
                                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .hasMatch(val)
                                        ? null
                                        : "invalid email";
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    suffixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: passwordTextEditngController,
                                  obscureText: true, //to show stars
                                  validator: (val) {
                                    return val.length > 6
                                        ? null
                                        : "provide 6+ character ";
                                  },

                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: Icon(Icons.visibility_off),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            //padding: EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                signIn();
                              },
                              color: Colors.lightGreen[600],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          child: Text.rich(
                            TextSpan(text: 'Don\'t have an account  ', children: [
                              TextSpan(
                                text: 'Signup',
                                style: TextStyle(color: Color(0xffEE7B23),fontSize: 18),
                              ),
                            ]),
                          ),
                        ),
                        // SizedBox(height:20.0),

                        // Center(
                        //   child: Text(
                        //     'OR'
                        //     ' LOGIN WITH',
                        //     style: TextStyle(color: Colors.black, fontSize: 20),
                        //   ),
                        // ),
                        // SizedBox(
                        //     // height:10,
                        //     ),
                        // Container(
                        //   height: 60,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       Image(
                        //         image: AssetImage('assets/facebook.png'),
                        //       ),
                        //       SizedBox(
                        //         width: 26,
                        //       ),
                        //       Image(image: AssetImage('assets/google2.png'))
                        //     ],
                        //   ),
                        // ),
                      ],
                    ))
                  ],
                ),
              ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
