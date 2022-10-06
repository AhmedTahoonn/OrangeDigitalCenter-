
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange/View/Components/core/AppBar/AppBar.dart';
import 'package:orange/View/Components/core/Button/Button.dart';
import 'package:orange/View/Components/core/TextFormField/TextFormField.dart';

class support_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Support",
          context: context,
          leadingIcon: Icons.arrow_back_ios,
          leadingIconColor: Colors.deepOrange,
          leadingOnPressed: () {
            Navigator.pop(context);
          }),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 25.0, right: 15.0, left: 15.0, bottom: 25),
          child: Column(
            children: [
              customTextFormField(hintText:'Name',prefixIcon: Icons.person,fil: true,isPrefix: true),
              const SizedBox(
                height: 20,
              ),
              customTextFormField(hintText:'E-Mail',prefixIcon: Icons.email,fil: true,isPrefix: true),
              const SizedBox(
                height: 20,
              ),
              customTextFormField(hintText:'What\'s making you unhappy?',maxLines: 6,fil: true,isPrefix: false),
              const SizedBox(height: 30,),
              customButton(text: "Submit"),
            ],
          ),
        ),
      ),
    );
  }
}
