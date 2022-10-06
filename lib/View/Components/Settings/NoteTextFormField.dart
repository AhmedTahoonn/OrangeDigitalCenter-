import 'package:flutter/material.dart';

Widget NoteTextFormField({
   String ?labelText,
   String ?hintText,

  IconData ?suffixIcon,
  Function()?onTaP,
  TextEditingController? controller,
  FormFieldValidator<String>?validator,
   String ?validationText,
  bool obscureText=false,
  Function()?suffixIconOnTap,
  int ?maxLines,
  bool?enabled,
})=>TextFormField(
  maxLines: maxLines,
  controller: controller,
  enabled: enabled,
  decoration: InputDecoration(
    hintText: hintText,
    floatingLabelStyle: const TextStyle(color: Colors.black),
    labelText: labelText,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)),
      borderSide: const BorderSide(color: Colors.deepOrange),
    ),
    labelStyle: const TextStyle(color: Colors.grey),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.teal,
      ),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.teal,
      ),
    ),

  ),
);
