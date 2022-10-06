import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Models/HomeCategoryModel/HomeCategoryModel.dart';
import '../Notes_Page/Notes_Page.dart';
import '../Events_Page/event_page.dart';
import '../Finals_Page/Finals_Page.dart';
import '../Lectures_Page/lectures.dart';
import '../Midterms_Page/Midtearms_Page.dart';
import '../Sections_Page/Sections_Page.dart';

class home_Screen extends StatelessWidget {
  List<HomeCategoryModel>categoryItems=
  [
    HomeCategoryModel(name: 'Lectures', image: 'assets/icons/lecture.svg', nextScreen: lecture_Screen()),
    HomeCategoryModel(name: 'Sections', image: 'assets/icons/sections.svg', nextScreen: Section_Screen()),
    HomeCategoryModel(name: 'Midterms', image: 'assets/icons/midterm.svg', nextScreen: Midterms_Screen()),
    HomeCategoryModel(name: 'Finals', image: 'assets/icons/final.svg', nextScreen: Finals_Screen()),
    HomeCategoryModel(name: 'Events', image: 'assets/icons/event.svg', nextScreen: Events_Screen()),
    HomeCategoryModel(name: 'Notes', image: 'assets/icons/notes.svg', nextScreen: Notes_Screen()),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: RichText(
            text: const TextSpan(
              text: "Orange",
              style: TextStyle(color: Colors.deepOrange, fontSize:24,
                fontWeight: FontWeight.bold,),
              children: <TextSpan>[
                TextSpan(
                    text: ' Digital Center ',
                    style: TextStyle(color: Colors.black, fontSize:24,fontWeight: FontWeight.bold,)),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: SizedBox(
          child: GridView.count(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 3.0,
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.2,

            children: List.generate(categoryItems.length,
                    (index) => buildCategoryItem(categoryItems[index], context)),
          ),
        ),
      ),

    );
  }
}
Widget buildCategoryItem(HomeCategoryModel model, context) => InkWell(
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => model.nextScreen,),);
  },
  child: Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey[200],
            child:  SvgPicture.asset(
                model.image,
                height: 40,
                color: Colors.deepOrange,
            ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.deepOrange,
          ),
        )
      ],
    ),
  ),
);
