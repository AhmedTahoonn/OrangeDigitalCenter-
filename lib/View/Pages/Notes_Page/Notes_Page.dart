import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange/View/Components/core/AppBar/AppBar.dart';

import '../HomeLayout_Page/HomeLayout.dart';
import '../AddNotes_Page/AddNotes.dart';
import '../Home_Page/Home.dart';

class Notes_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Add_notes(),));
        },
        backgroundColor: Colors.blueGrey[200],
        child: const Icon(Icons.add,color: Colors.black,),
      ),
      appBar:customAppBar(title: "Notes", context: context,leadingIcon: Icons.arrow_back_ios,leadingIconColor: Colors.black,
          leadingOnPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeLayout_Screen(),), (route) => false);
          }
      ),
      body : const Center(
        child: Text('There\'s No Data To Show',style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w400

        ),),
      ),
    );
  }
}
