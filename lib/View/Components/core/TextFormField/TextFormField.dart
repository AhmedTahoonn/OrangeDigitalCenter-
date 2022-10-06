import 'package:flutter/material.dart';

Widget customTextFormField({
   String ?labelText,
   String ?hintText,
  IconData ?suffixIcon,
  Function()?onTaP,
  TextEditingController? controller,
  FormFieldValidator<String>?validator,
   String ?validationText,
  bool obscureText=false,
  Function()?suffixIconOnTap,
  IconData ?prefixIcon,
  int ?maxLines=1,
  bool ?fil,
   bool isPrefix=false,



})=> TextFormField(
  controller: controller,
  onTap: onTaP,
  obscureText:obscureText,
  validator: (value){
    if (value!.isEmpty) {
      return " $validationText";
    } else {
      return null;
    }

  },

cursorColor: Colors.deepOrange,
  maxLines: maxLines,
  decoration: InputDecoration(
    filled: fil,
    fillColor: Colors.grey[200],
    floatingLabelStyle: const TextStyle(color: Colors.deepOrange),
    labelText: labelText,
    hintText: hintText,
    prefixIcon: (prefixIcon==null)?null:Icon(prefixIcon),
    labelStyle: const TextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.deepOrange),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),

      borderRadius: BorderRadius.circular(20),
    ),
   border:OutlineInputBorder(
     borderRadius: BorderRadius.circular(20),
     borderSide: const BorderSide(color: Colors.black,),

   ) ,
   errorBorder:OutlineInputBorder(
     borderRadius: BorderRadius.circular(20),
     borderSide: const BorderSide(color: Colors.deepOrange),
   ),
    suffixIcon:IconButton(
      onPressed: suffixIconOnTap,
      icon: Icon(suffixIcon,color: Colors.deepOrange,),
    ),
  ),
);
