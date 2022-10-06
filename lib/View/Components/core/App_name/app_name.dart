import 'dart:ffi';

import 'package:flutter/material.dart';

Widget customAppName({
  double fontSize=22.0,
}) => Align(
      alignment: Alignment.center,
      child: RichText(
        text:  TextSpan(
          text: "Orange",
          style:  TextStyle(
            color: Colors.deepOrange,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' Digital Center ',
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
