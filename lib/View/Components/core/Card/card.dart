import 'package:flutter/material.dart';

Widget customCard(
{
 required String lectureName,
  required String lectureDate ,
  required String lectureStartTime ,
  required String lectureEndTime ,



})=>Padding(
  padding: const EdgeInsets.only(bottom: 15.0),
  child:   Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.grey,
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lectureName,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Row(
                  children: const [
                    Icon(Icons.timer, color: Colors.black),
                    Text("2hrs")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Lecture Date",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    Row(
                      children:  [
                        const Icon(Icons.calendar_month,
                            color: Colors.black),
                        const SizedBox(width: 5),
                        Text(
                            lectureDate ,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Start Time",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    Row(
                      children:  [
                        Icon(Icons.watch_later, color: Colors.green[300]),
                        const SizedBox(width: 5),
                        Text(lectureStartTime,
                            style: const TextStyle(fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "End Time",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    Row(
                      children:  [
                        Icon(Icons.watch_later, color: Colors.red[300]),
                        const SizedBox(width: 5),
                        Text(lectureEndTime,
                            style: const TextStyle(fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      )),
);