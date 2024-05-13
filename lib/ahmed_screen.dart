import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mwf09e1/reuseable_widget.dart';

class AhmedScreen extends StatefulWidget {
  const AhmedScreen({super.key});

  @override
  State<AhmedScreen> createState() => _AhmedScreenState();
}

class _AhmedScreenState extends State<AhmedScreen> {

  List names = ["Fawad Khan", "Ahmed Surti", "Taha Shafique", "Basit Ali", "Alina", "Musfirah"];
  List profileColor = [Colors.grey.shade200, Colors.grey.shade300, Colors.grey.shade400, Colors.grey.shade500, Colors.grey.shade600, Colors.grey.shade700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
             children: [
        
               // Background Container
               Container(
                 width: double.infinity,
                 height: 200,
                 margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
               ),
        
               // Cover Photo
               Container(
                 width: double.infinity,
                 height: 150,
                 margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.grey.shade800,
                 ),
               ),
        
               // Profile Photo
               Positioned(
                 top: 100,
                 left: 30,
                 child: CircleAvatar(
                   radius: 50,
                   backgroundColor: Colors.grey.shade600,
                 ),
               ),
        
               Positioned(
                   top: 160,
                   left: 130,
                   child: Text("Rohan Kumar",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),))
        
             ],
            ),
        
           Container(
             width: double.infinity,
             padding: EdgeInsets.all(10),
             margin: EdgeInsets.symmetric(horizontal: 10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(14),
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.shade400,
                   spreadRadius: 1,
                   blurRadius: 10
                 )
               ]
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                   children: [
                     Text("10K"),
                     Text("Follow",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),)
                   ],
                 ),
        
                 SizedBox(
                   height: 20,
                   child: VerticalDivider(
                     color: Colors.grey.shade800,
                     width: 1,
                     thickness: 1
                   ),
                 ),
        
                Column(
                   children: [
                     Text("8.9K"),
                     Text("Followers",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),)
                   ],
                 ),
        
                 SizedBox(
                   height: 20,
                   child: VerticalDivider(
                       color: Colors.grey.shade800,
                       width: 1,
                       thickness: 1
                   ),
                 ),
        
                 Column(
                   children: [
                     Text("100K"),
                     Text("Likes",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),)
                   ],
                 ),
               ],
             ),
           ),
        
            SizedBox(
            height: 10,
            ),
        
            SizedBox(
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  itemCount: names.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: profileColor[index],
                          ),
                          Text(names[index])
                        ],
                      ),
                    );
                  },),
              ),
            ),
        
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              childAspectRatio: 250 / 300,
              children: List.generate(6, (index) =>  Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        spreadRadius: 1,
                        blurRadius: 10
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(14)
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Sameer"))
                ],
              ),
            )),)
          ],
        ),
      )
    );
  }
}




