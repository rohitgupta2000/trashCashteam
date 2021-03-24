import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trashcash_home/helper/constants.dart';
//import 'package:trashcash_home/helper/constants.dart';
import 'package:trashcash_home/helper/helperfunction.dart';
//import 'package:trashcash_home/services/database.dart';


class UserProfile extends StatefulWidget {
  

//final DatabaseMethods databaseMethods=new DatabaseMethods();

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String name;
 @override
 
  void initState() {
     getUserName();
     super.initState();
  }
    
getUserName() async{
  await HelperFunctions.getUserNameSharedPreference().then((value){
    setState(() {
       constants.myNAme=value;
    });
   
  });

}
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    'Hello ,',
                    style: GoogleFonts.redressed(
                      fontSize: 20,
                      // backgroundColor: Colors.red,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#cdfffc'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 3, 0, 8),
                  child: Text(  constants.myNAme !=null? "${constants.myNAme.substring(0,1).toUpperCase()}"+
            "${constants.myNAme.substring(1,constants.myNAme.length)}":"const.myname is null",
                    //'Natasha Meher',
                    style: GoogleFonts.redressed(
                      fontSize: 23,letterSpacing: -0.2,
                      // backgroundColor: Colors.red,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 20),
            child: CircleAvatar(
              child:Stack(fit: StackFit.expand,
              children: [
                
                 ClipOval(
                   
                                    child: FutureBuilder(
                                  future: getImage(context, constants.myNAme+"dp"),
                                  builder: (context,snapshot){
                                  
                                    if(snapshot.connectionState==ConnectionState.done){
                                      return Container(
                                        width: 50,height: 50,
                                        child: snapshot.hasData? snapshot.data:alternativeDp());
                                    }
                                      if(snapshot.connectionState==ConnectionState.waiting){
                                      return Container(
                                        width: 20,height: 20,
                                        child: CircularProgressIndicator(),);
                                    }
                                    return Container(child: Text("hibro"),);
                                  },),
                 )
              ],)
              //constants.isDpUpdated==true? 
                
              // NetworkImage(
              //     'https://images.unsplash.com/photo-1597248374161-426f0d6d2fc9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2000&q=80')
              
             // maxRadius: 20,
            // ): NetworkImage(
            //      'https://images.unsplash.com/photo-1597248374161-426f0d6d2fc9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2000&q=80')
             
          )
         ) ]),
      ],
      
    );
   
  }
   Widget alternativeDp(){
  return Container(
    child:  FutureBuilder(
                                future: getImage(context,"avai/coins.png"),
                                builder: (context,snapshot){
                                  if(snapshot.connectionState==ConnectionState.done){
                                    return Container(
                                   //   width: 50,height: 50,
                                      child: snapshot.data,);
                                  }
                                    if(snapshot.connectionState==ConnectionState.waiting){
                                    return Container(
                                      width: 20,height: 20,
                                      child: CircularProgressIndicator(),);
                                  }
                                  return Container();
                                },) ,
  );
}
}

Future <Widget> getImage(BuildContext context, String imageName)async{
Image image;
await FirebaseStorageService.loadImage(context, imageName).then((value) {
  image=Image.network(
    value.toString(), fit: BoxFit.fill,
  );
  print(value.toString()+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
});
return image;

}

class FirebaseStorageService extends ChangeNotifier{
  FirebaseStorageService();
  static Future<dynamic> loadImage(BuildContext context,String image)async{
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
