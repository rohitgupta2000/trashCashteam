import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
//import 'package:path/path.dart';

//import 'dp.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  bool isloading = false;

  File _imageFile;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // setState(() {
    //   isloading=true;
    // });

    setState(() {
      _imageFile = File(pickedFile.path);
      isloading = true;
    });
    await uploadImageToFirebase(context);
    await HelperFunctions.saveUserDpSharedPreference(true);
    constants.isDpUpdated=true;
    print("upload finishedddddddddddddddddddddddddd");
    
    setState(() {
      isloading = false;
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    print("uploaadddd intiateddddddddddddddddddddddddddddd");
    //String fileName = "abc"; //basename(_imageFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(constants.myNAme+"dp");
    UploadTask uploadTask = ref.putFile(_imageFile);
    await uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
                margin: EdgeInsets.only(top: 15),
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(fit: StackFit.expand,
                        // overflow: Overflow.visible,
                        children: [
                          CircleAvatar(
                            child: Stack(
                              fit: StackFit.expand,
                                children:[
                                      ClipOval(
                                
                                child: 
                                 FutureBuilder( 
                                  future: getImage(context, constants.myNAme+"dp"),
                                  builder: (context,snapshot){
                                    if(snapshot.connectionState==ConnectionState.done){
                                      return Container(
                                       // width: 50,height: 50,
                                        child:snapshot.hasData? snapshot.data:alternativeDpforProfilePic(),);
                                    }
                                      if(snapshot.connectionState==ConnectionState.waiting){
                                      return Container(
                                        width: 20,height: 20,
                                        child: CircularProgressIndicator(),);
                                    }
                                    return Container();
                                  },
                                ),
                                //  Image.file(_imageFile,
                                //     height: 500, width: 200, fit: BoxFit.fill),
                              )],
                            ),
                            radius: 50,
                          ),
                        ])),
              );
              
   
}
 Widget alternativeDpforProfilePic(){
   return    isloading
        ? Container(
            child: Center(
            child: CircularProgressIndicator(),
          ))
        : _imageFile != null
            ? Container(
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(fit: StackFit.expand,
                        // overflow: Overflow.visible,
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: 
                               FutureBuilder(
                                future: getImage(context, constants.myNAme+"dp"),
                                builder: (context,snapshot){
                                  if(snapshot.connectionState==ConnectionState.done){
                                    return Container(
                                      width: 50,height: 50,
                                      child:snapshot.hasData? snapshot.data: CircularProgressIndicator(),);
                                  }
                                    if(snapshot.connectionState==ConnectionState.waiting){
                                    return Container(
                                      width: 20,height: 20,
                                      child: CircularProgressIndicator(),);
                                  }
                                  return Container();
                                },
                              ),
                              //  Image.file(_imageFile,
                              //     height: 500, width: 200, fit: BoxFit.fill),
                            ),
                            radius: 50,
                          ),
                        ])),
              )

             :
            Container(
              //  padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 180,
                  width: 180,
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.JPG'),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 35,
                        child: SizedBox(
                          height: 40,
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
   

Future <Widget> getImage(BuildContext context, String imageName)async{
Image image;
await FirebaseStorageService.loadImage(context, imageName).then((value) {
  image=Image.network(
    value.toString(),fit: BoxFit.fill,
  );
});
return image;

}

class FirebaseStorageService extends ChangeNotifier{
  FirebaseStorageService();
  static Future<dynamic> loadImage(BuildContext context,String image)async{
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
