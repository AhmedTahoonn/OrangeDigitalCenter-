import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange/View/Components/core/App_name/app_name.dart';

import '../HomeLayout_Page/HomeLayout.dart';
import 'News_Page.dart';

class New_App_Details extends StatelessWidget {
final String title;
final String date;
 final String  body;
 New_App_Details({
   required this.title,
   required this.body,
   required this.date,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:
          [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    color: Colors.grey[300],
                    child: customAppName(fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,top: 10),
                    child:  Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        const CircleAvatar(radius: 20,backgroundColor: Colors.white,),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);

                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0)+const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(title,style: const TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),),
                      Text(date,style: const TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.center,
                        child: Text(body,style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
