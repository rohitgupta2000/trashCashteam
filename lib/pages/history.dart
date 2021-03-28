import 'package:flutter/material.dart';
import 'package:trashcash_home/services/database.dart';
class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DatabaseMethods databaseMethods=new DatabaseMethods();
  
  Stream orderStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Your previous orders")),
      body:SingleChildScrollView(
              child: Column(
          children: [
            StreamBuilder(
            stream: orderStream,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? 
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.docs.length,               
                      itemBuilder: (context, index) {

                        return Column(
                          children: [
                          //   Container(
                          //   margin: EdgeInsets.all(15),
                          //   child: Text("Order Number - "+(index+1).toString(),style: TextStyle(fontSize: 25),),
                          // ),
                          Column(children: [
                          ordertile("Category :  "+snapshot.data.docs[index].data()["Category"].toString()),                            
                          ordertile("Details :  "+snapshot.data.docs[index].data()["details"].toString()),
                          ordertiledes("Description :  "+snapshot.data.docs[index].data()["description"].toString()),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.blue[200]),
                            child: Text("Pickup Details",style: TextStyle(color: Colors.red),),
                          ),
                          ordertile("Full Name :  "+snapshot.data.docs[index].data()["Full name"].toString()),
                           ordertile("Email-Id :  "+snapshot.data.docs[index].data()["Email"].toString()),
                            ordertile("Address :  "+snapshot.data.docs[index].data()["Address"].toString()),
                             ordertile("Pincode :  "+snapshot.data.docs[index].data()["Pincode"].toString()),
                           ordertile("City :  "+snapshot.data.docs[index].data()["city"].toString()),
                            ordertile("State :  "+snapshot.data.docs[index].data()["state"].toString()),
                             ordertile("Mobile Number :  "+snapshot.data.docs[index].data()["mobile number"].toString()),




                          ],),
                         
                           
                       //     Text(""+snapshot.data.docs[index].data()[""].toString(),style: TextStyle(fontSize: 20),),
                          ],
                        );

                      }):Container();
                        
                          //  snapshot.data.docs[index].data()["message"],snapshot.data.docs[index].data()["sendBy"]==Constants.myNAme);
                      },
                    ),
                     
          ],
        ),
      )
             
    );
  }
  @override
  void initState() {
    settingOrderStream();
    super.initState();
  }
  settingOrderStream()async{
 await  databaseMethods.getOrderDetails().then((value){
setState(() {
  orderStream=value;
}); });

}

}
Widget ordertile(String string){
 return Container(
          //  margin: EdgeInsets.all(2),
            width: double.infinity,height: 20,
           // alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
            ),
            child: Text(string,style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.left,)
          
        );
        
        

}
Widget ordertiledes(String string){
 return Container(
          //  margin: EdgeInsets.all(2),
            width: double.infinity,height: 50,
           // alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
            ),
            child: Text(string,style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.left,)
          
        );
}