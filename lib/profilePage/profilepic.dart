import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:path/path.dart';
import 'dp.dart';


import 'dp.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  bool isloading=false;


 File _imageFile;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    
   
    // setState(() {
    //   isloading=true;
    // });

    setState(() {
      _imageFile = File(pickedFile.path);
      isloading=true;
    });  
     await uploadImageToFirebase(context);
     print("upload finishedddddddddddddddddddddddddd");
     setState(() {
       isloading=false;
     });
   
  
  }

 Future uploadImageToFirebase(BuildContext context) async {
   print("uploaadddd intiateddddddddddddddddddddddddddddd");
   String fileName = "abc";//basename(_imageFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('profilepic/filename');
    UploadTask uploadTask = ref.putFile(_imageFile);
    await uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return  isloading? Container(child :Center(child:CircularProgressIndicator() ,) ):
     _imageFile != null
     ? 
     
     Container(margin: EdgeInsets.only(top:20),
       child: SizedBox(
          height: 150,
          width: 150,
          child: Stack(
            fit: StackFit.expand,
           // overflow: Overflow.visible,
            children: [
             
             CircleAvatar(
               
    child: ClipOval(
         child: Image.file(_imageFile,
         height: 500,
              width: 200,
              fit: BoxFit.fill
          ),
    ),
    radius: 50,
),
              ])),
     )
            //                    CircleAvatar(
            //                     child: Image.file(_imageFile),
            //   //backgroundImage: AssetImage('assets/avatar.JPG'),
            // )
                  //             Expanded(
                  // child: Stack(
                  //   children: <Widget>[
                  //     Container(
                  //       height: 150,width: 150,
                  //       margin: const EdgeInsets.only(
                  //           left: 30.0, right: 30.0, top: 10.0),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(360.0),
                  //         child: Image.file(_imageFile)))]))
                              :
     Container(
      padding: EdgeInsets.only(top:20),
      child: SizedBox(
          
        height: 130,
        width: 130,
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.JPG'),
            ),
            Positioned(
              right: -4,
              bottom: 5,
              child: SizedBox(
                height: 50,
                width: 50,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Color(0xFFF5F6F9),
                  onPressed: () {
                    pickImage();

                  //  Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) =>  UploadingImageToFirebaseStorage ()));
                  },
                  child: SvgPicture.asset("assets/camera2.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
