
import 'package:flutter/material.dart';


class NotificationTile extends StatelessWidget {
  final String userName;
  final String text;
  //final String chatRoomId;
  NotificationTile(this.userName,this.text);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
             onTap: (){
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context)=> ConversationScreen(chatRoomId)));
             },
          child: Container(
            color: Colors.black54,
        margin: EdgeInsets.symmetric(vertical:1),
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
        child: Row(children: [
          Container(
            
            alignment: Alignment.center,
            height: 40,width: 40,
          decoration: BoxDecoration(
            color:Colors.green[900],
            borderRadius: BorderRadius.circular(40)


          ),
            child: Text("${userName.substring(0,1).toUpperCase()}",style: TextStyle(
  color: Colors.white, fontSize: 17),),
          ),
          SizedBox(width:8,),
          Expanded(
                      child: Container( padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(userName + text,style: TextStyle(
  color: Colors.white, fontSize: 17),)),
          ),

                 
           //    Expanded(child: Text("your profile picture has been updated now what to do ")), 
                          
           
        ],
        
        ),
        
      ),
    );
  }
       }