import 'package:flutter/material.dart';
import 'package:trashcash_home/pages/ewasteForm.dart';
import 'package:trashcash_home/pages/orderPlaced.dart';
import 'package:trashcash_home/pages/orders.dart';
class Ewaste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E-waste")),
      body: Column(children: [
       GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> EwasteForm("Mobile Phones")));
         },
         child: EwasteTile("Mobile Phones")),

          GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> EwasteForm("Computers/Laptops")));
         },
         child: EwasteTile("Computers/Laptops")),
       GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> EwasteForm("Fridges")));
         },
         child: EwasteTile("Fridges")),
         GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> EwasteForm("Washing Machines")));
         },
         child: EwasteTile("Washing Machines")),
         GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> EwasteForm("Stereo Systems")));
         },
         child: EwasteTile("Stereo Systems")),
         GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> EwasteForm("Kettles")));
         },
         child: EwasteTile("Kettles")),
         GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderPlaced()
          // EwasteForm("Toasters")
           ));
         },
         child: EwasteTile("Toasters")),
       
       
      ],),

    );
  }
}
Widget EwasteTile(String string){
  BuildContext context;
  return 
               Container(
            margin: EdgeInsets.all(2),
            width: double.infinity,height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
            ),
            child:Text(string,style: TextStyle(color: Colors.black,fontSize: 25),),
          
        );

}