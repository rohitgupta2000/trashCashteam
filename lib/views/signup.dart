import 'package:flutter/material.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
import 'package:trashcash_home/main.dart';
import 'package:trashcash_home/services/auth.dart';
import 'package:trashcash_home/services/database.dart';

import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isLoading = false;
  DatabaseMethods databaseMethods = new DatabaseMethods();
  AuthMethods authMethods = new AuthMethods(); //to use the methods of the class

  static final formKey = GlobalKey<FormState>();

  TextEditingController userNametextEditingController =
      new TextEditingController();

  TextEditingController passwordtextEditingController =
      new TextEditingController();

  TextEditingController emailtextEditingController =
      new TextEditingController();

  TextEditingController confirmPasswordtextEditingController =
      new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "name": userNametextEditingController.text,
        "email": emailtextEditingController.text
      };
      HelperFunctions.saveUserEmailSharedPreference(
          emailtextEditingController.text);
      HelperFunctions.saveUserNameSharedPreference(
          userNametextEditingController.text);
      //constants.myNAme=userNametextEditingController.text;

      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(emailtextEditingController.text,
              passwordtextEditingController.text)
          .then((value) {});
      databaseMethods.uploadUserInfo(userInfoMap); //uploading a map to database
      HelperFunctions.saveuserLoggedInSharedPreference(true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
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
      body: isLoading
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an account, It's free ",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (val) {
                              //the val is the value user input in the textfield
                              return val.isEmpty || val.length < 4
                                  ? "invalid username"
                                  : null;
                            },
                            controller: userNametextEditingController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (val) {
                              return RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(val)
                                  ? null
                                  : "invalid email";
                            },
                            controller: emailtextEditingController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            obscureText: true, //to show stars
                            validator: (val) {
                              return val.length > 6
                                  ? null
                                  : "provide 6+ character ";
                            },
                            controller: passwordtextEditingController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            obscureText: true, //to show stars
                            validator: (val) {
                              return val == passwordtextEditingController.text
                                  ? null
                                  : "password do not match ";
                            },
                            controller: confirmPasswordtextEditingController,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              suffixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          // inputFile(label: "Username"),
                          // inputFile(label: "Email"),
                          // inputFile(label: "Password", obscureText: true),
                          // inputFile(label: "Confirm Password ", obscureText: true),
                        ],
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
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
                          signMeUp();
                        },
                        color: Colors.lightGreen[600],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text.rich(
                            TextSpan(
                                text: 'Already have an account',
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(color: Color(0xffEE7B23)),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  login() {}
}

loginPage() {}

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
