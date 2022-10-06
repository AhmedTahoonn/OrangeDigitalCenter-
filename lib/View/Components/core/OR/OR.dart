import 'package:flutter/material.dart';

Widget customOr()=>Row(
  children: [
    Expanded(
      child: Container(
        height: 1.5,
        color: Colors.grey,
      ),
    ),
    const Text(
      " OR ",
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    Expanded(
      child: Container(
        height: 1.5,
        color: Colors.grey,
      ),
    ),
  ],
);
