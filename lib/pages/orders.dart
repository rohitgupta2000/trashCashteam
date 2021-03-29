import 'package:flutter/material.dart';
import 'package:trashcash_home/services/database.dart';
import 'package:trashcash_home/views/mainpage.dart';
class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  DatabaseMethods databaseMethods=new DatabaseMethods();
  
  Stream orderStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Orders"),automaticallyImplyLeading: false,
       actions: [
         GestureDetector(
           onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  MainPage()));
           
         
           },
           child:  Container(
            padding: EdgeInsets.symmetric(horizontal:20),
            child: Icon(Icons.exit_to_app),color: Colors.black26,
            ),
         )
        ],),
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
                            SizedBox(height: 20,),
                          //   Container(
                          //   margin: EdgeInsets.all(15),
                          //   child: Text("Order Number - "+(index+1).toString(),style: TextStyle(fontSize: 25),),
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width-20,
                            decoration: BoxDecoration(
                              border: new Border.all(
                          color: Colors.black,
                          width: 1.5,
                          style: BorderStyle.solid),
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(40)),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey[50],
                          offset: new Offset(0, 0.1),
                          blurRadius: 0.1,
                        )

                      ],
                      ),
                            child: Column(children: [
                              SizedBox(height: 20,),
                         
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width/2,
                              decoration: BoxDecoration(color: Colors.green[200],
                              borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("Pickup Details",style: TextStyle(color: Colors.red),),
                            ),
                            ordertile("Full Name :  ",snapshot.data.docs[index].data()["Full name"].toString()),
                             ordertile("Email-Id :  ",snapshot.data.docs[index].data()["Email"].toString()),
                              ordertile("Address :  ",snapshot.data.docs[index].data()["Address"].toString()),
                               ordertile("Pincode :  ",snapshot.data.docs[index].data()["Pincode"].toString()),
                             ordertile("City :  ",snapshot.data.docs[index].data()["city"].toString()),
                              ordertile("State :  ",snapshot.data.docs[index].data()["state"].toString()),
                               ordertile("Mobile Number :  ",snapshot.data.docs[index].data()["mobile number"].toString()),
                               Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width/2,
                              decoration: BoxDecoration(color: Colors.green[200],
                              borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("Order Details",style: TextStyle(color: Colors.red),),
                            ),

                                ordertile("Category :  ",snapshot.data.docs[index].data()["Category"].toString()),                            
                            ordertile("Details :  ",snapshot.data.docs[index].data()["details"].toString()),
                            ordertiledes("Description :  ",snapshot.data.docs[index].data()["description"].toString()),
                               SizedBox(height:35 ,
                                child: Container(
                            child:  Container(
              alignment: Alignment.center,
              // height: 40,
              width: MediaQuery.of(context).size.width/1.4,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(40)),
              child: Text(
                (index+1).toString(),
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),

                          ),
                              ),
                              SizedBox(height:8),
                            ],),
                          ),
                          SizedBox(height:40 ,
                         
                              )
                           
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
Widget ordertile(String string1,String string2){

 return Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 3),
        child: Row(
          children: [
            Container(
              
             width:  100,
              
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              // height: 40,
              // width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
              child: Text(string1)
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    string2,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )),
            ),

            //    Expanded(child: Text("your profile picture has been updated now what to do ")),
          ],
        ),
      );
        
}

Widget ordertiledes(String string1,String string2){
 return Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Row(
          children: [
            Container(
              width: 100,
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              // height: 40,
              // width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
              child: Text(string1)
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    string2,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )),
            ),

            //    Expanded(child: Text("your profile picture has been updated now what to do ")),
          ],
        ),
      );
        
}