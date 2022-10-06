import 'package:flutter/material.dart';

Widget customListTile({
  required String text,
  required Function()onTap,
})=>InkWell(
  onTap:onTap,
  child: ListTile(

    title: Text(text,style: const TextStyle(

        color: Colors.black,

        fontSize: 17

    ),),

    trailing: const Icon(Icons.arrow_forward_ios),

  ),
);