import 'package:trashcash_home/pages/homePage.dart';
import 'package:trashcash_home/pages/orders.dart';

import './uploadpost.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;
  final List<Widget> _children = [
  AdminPosts(),OrdersPage(),Container()
  ];
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
       floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  UploadingImageToFirebaseStorage()));
  },
  icon: Icon(Icons.add_a_photo),
  label: Text("New post"),
),
    
      //  floatingActionButton: FloatingActionButton(
      //    shape: ,
      //   onPressed: () {
      //      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  UploadingImageToFirebaseStorage()));
      //   },
      //   child:Text("New Post",textAlign: TextAlign.center,)
      //   //  Icon(Icons.add),
      //   // backgroundColor: Colors.red,
      // ),
    //  floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      body: _children[currentIndex],

      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        //fabLocation: BubbleBottomBarFabLocation.center,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.post_add,
                color: Colors.black,
              ),
              activeIcon: Icon(
                
                Icons.post_add,
                color: Colors.blue,
                
              ),
              title: Text("Posts")),
              
              
               BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                
                Icons.dashboard,
                color: Colors.red,
                
              ),
              title: Text("Track Orders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Track Logestic")),
         
         
        ],
      ),
    );
  }
}
Widget AdminPosts(){
  return Scaffold(
    appBar: AppBar(title: Text("Admin DashBoard")),
    
    body: postsThatWeWantToShow(),

  );
}