import 'package:flutter/material.dart';

class HomeCategoryModel
{
  String image;
  String name;
  Widget nextScreen;
  HomeCategoryModel({
    required this.name,
    required this.image,
    required this.nextScreen,
  });
}