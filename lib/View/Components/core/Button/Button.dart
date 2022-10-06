import 'package:flutter/material.dart';

Widget customButton({
  required String text,
  Color ?textColor=Colors.white,
  Color ?buttonColor=Colors.deepOrange,
  Function ()?onTap,
}) => SizedBox(
    height: 50,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(buttonColor),
      ),
      child:  Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,color: textColor),
      ),
    ));
