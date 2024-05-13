import 'package:flutter/material.dart';
import 'package:mwf09e1/API/fetch_screen.dart';
import 'package:mwf09e1/ahmed_screen.dart';
import 'package:mwf09e1/grid_screen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FetchScreen(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("My First App",style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: Color(0xFFD0FFAC)
        ),),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("images/mountain_image.jpg"),
          ),
          SizedBox(
            width:10,
          ),
        ],
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Conatiner
            Container(
              width: 250,
              height: 180,
              color: Colors.pink,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your Name",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),),
                      Text("Your email Address here",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white),)

                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person,color: Colors.white,),
              title: Text("Profile",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.white,),
              title: Text("Settings",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.security,color: Colors.white,),
              title: Text("Privacy policy",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.red,),
              title: Text("Logout",style: TextStyle(color: Colors.red),),
            )
          ],
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 40,
            height: 80,
            color: Colors.green,
          ),
          Container(
            width: 40,
            height: 40,
            color: Colors.red,
          ),
          Container(
            width: 40,
            height: 80,
            color: Colors.green,
          ),
        ],
      )
    );
  }
}




