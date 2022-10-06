import 'package:flutter/material.dart';

Widget customDropDownButton({
  required String text,
 required String dropdownValue,
 required List<String> items,
Function(String?)?onchange,

})=> Column(
  children: [
     Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.deepOrangeAccent,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton(
          underline: Container(),
          borderRadius: BorderRadius.circular(15),
          value: dropdownValue,
          style: const TextStyle(color: Colors.black),
          onChanged:onchange,
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ))
  ],
);
