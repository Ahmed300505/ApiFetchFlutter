import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwf09e1/API/api_services.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {

  bool isExpanded = false;
  int pageNumber = 1;

  void increment(){
    setState(() {
      pageNumber = pageNumber + 1;
    });
  }

  void decrement(){
    if (pageNumber > 1) {
      setState(() {
        pageNumber = pageNumber - 1;
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already on First Page")));
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          decrement();
        }, icon: Icon(Icons.chevron_left)),
        title: Text("$pageNumber"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
           increment();
          }, icon: Icon(Icons.chevron_right))
        ],
      ),
      body: FutureBuilder(
          future: ApiServices.getApiData(pageNumber),
          builder: (context, snapshot) {


            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }

            if (snapshot.hasData) {

              Map map = jsonDecode(snapshot.data);
              List myData = map["tv_shows"];

              return  ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              spreadRadius: 1,
                              blurRadius: 10
                          )
                        ],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          height: 110,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(image: NetworkImage("${myData[index]["image_thumbnail_path"]}"))
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: SizedBox(
                                  width: 200,
                                  child: Text("${myData[index]["name"]}",overflow: isExpanded == false ? TextOverflow.ellipsis : TextOverflow.fade,)),
                            ),
                            Text("${myData[index]["network"]}"),
                            Text("${myData[index]["start_date"]}"),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: myData[index]["status"] == "Ended" ? Colors.red : Colors.green
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("${myData[index]["status"]}"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },);
            }

            if (snapshot.hasError) {
              return Center(child: Icon(Icons.error,color: Colors.red,),);
            }

            return Container();
          },)
    );
  }
}
