//import 'dart:js';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
//import 'package:trashcash_home/helper/constants.dart';
//import 'package:trashcash_home/helper/helperfunction.dart';
import 'package:trashcash_home/pages/HomeSectionPages/LeaderboardContainer.dart';
import 'package:trashcash_home/pages/HomeSectionPages/LocationTextField.dart';
import 'package:trashcash_home/pages/HomeSectionPages/QuotationContainer.dart';
import 'package:trashcash_home/pages/HomeSectionPages/UserProfile.dart';
import 'package:trashcash_home/services/database.dart';

class TrashCashHome extends StatefulWidget {
  @override
  _TrashCashHomeState createState() => _TrashCashHomeState();
}

class _TrashCashHomeState extends State<TrashCashHome> {
//  @override
//   void initState() {

//     setState(() {

//     });
//      super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    // DatabaseMethods.saveImageUrl({"url":"ayushdp"});
    //   DatabaseMethods.saveImageUrl({"url":"trashcash2r"});

    return Scaffold(
      // appBar: AppBar(
      //  // toolbarOpacity: 0,
      //   //  backgroundColor: Colors.transparent,
      //   //   elevation: 0,
      // ),
      body: Container(
        //comment: main container
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //comment: image design and padding for the green container
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: const EdgeInsets.only(bottom: 80, top: 0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(185.0),
                    bottomRight: Radius.circular(185.0),
                  ),
                  color: HexColor('#32a852'),
                ),
                child: Column(
                  children: [
                    UserProfile(),
                    LocationTextField(),
                    QuotationContainer(),
                  ],
                ),
              ),
              LeaderBoardContainer(),
              postsThatWeWantToShow(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget postsThatWeWantToShow() {
  return Container(
    child: StreamBuilder(
        stream: DatabaseMethods.getImageUrl(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    //   print("shuruuuu "+ getImages(snapshot.data.docs[index].data()["url"]).toString()+"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

                    print((snapshot.data.docs[index].data()["url"]) +
                        "dppppppppppp");

                    return FutureBuilder(
                      future: getImage(
                          snapshot.data.docs[index].data()["url"].toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 40),

                            //width: 100,height: 100,

                            child: snapshot.data,
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Container();
                      },
                    );

                    //  getImages(snapshot.data.docs[index].data()["url"].toString());
                  });
        }),
  );
// FutureBuilder(
//                                 future: getImage("abc"),
//                                 builder: (context,snapshot){
//                                   if(snapshot.connectionState==ConnectionState.done){
//                                     return Container(
//                                    //   width: 50,height: 50,
//                                       child: snapshot.data,);
//                                   }
//                                     if(snapshot.connectionState==ConnectionState.waiting){
//                                     return Container(
//                                       width: 20,height: 20,
//                                       child: CircularProgressIndicator(),);
//                                   }
//                                   return Container();
//                                 },) ;
}
//  getImages(url){
// Image image;
// image=Image.network(url,fit: BoxFit.fill,);
// return image;
// }

Future<Widget> getImage(String imageName) async {
  BuildContext context;
  Image image;
  await FirebaseStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      fit: BoxFit.fill,
    );
  });
  return image;
}

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
// static Future<dynamic> listExample() async {
//  Future image;
//     ListResult result =
//         await FirebaseStorage.instance.ref().listAll();

//         // var storageref=FirebaseStorage.instance.ref("avai");
//         // storageref.listAll().then(Function(result){
//         //   result.items.forEach(Function(imageRef) {
//         //       displayImage(imageRef);
//         //   });
//         // });

//     result.items.forEach((Reference ref) {
//     image=  getImage("trashcash2r.png");

//         print('Found file: $ref');
//     }

//     );

//     result.prefixes.forEach((Reference ref) {
//         print('Found directory: $ref');
//     });
//     return image;

// }
}
