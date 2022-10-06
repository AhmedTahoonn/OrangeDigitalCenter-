import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/View/Components/core/AppBar/AppBar.dart';
import 'package:orange/View/Components/core/App_name/app_name.dart';


class partner_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  customAppBar(title: "Our Partners", context: context,leadingIcon: Icons.arrow_back_ios,leadingIconColor: Colors.black,leadingOnPressed: (){Navigator.pop(context);}),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10)

          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                const Text("ODCs",style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),),
                 Expanded(child: customAppName(fontSize: 28)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
