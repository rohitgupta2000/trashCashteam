import 'package:flutter/material.dart';
import 'package:trashcash_home/services/database.dart';
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
      appBar: AppBar(title:Text("Your orders")),
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
                          children: [Container(
                            margin: EdgeInsets.all(20),
                            child: Text("ordernumber"+index.toString()),
                          ),
                            Text(snapshot.data.docs[index].data().toString(),style: TextStyle(fontSize: 30),),
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