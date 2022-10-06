import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View/Components/core/AppBar/AppBar.dart';
import 'package:orange/View/Components/core/Card/card.dart';
import 'package:orange/View/Pages/Finals_Page/Finals_Page.dart';
import 'package:orange/View_Model/Bloc/Lecture_Cubit/lecture_cubit.dart';
import '../HomeLayout_Page/HomeLayout.dart';
import '../Home_Page/Home.dart';


class lecture_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LectureCubit()..getLectureData(),
      child: BlocConsumer<LectureCubit, LectureState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LectureCubit myCubit=LectureCubit.get(context);
          return Scaffold(
              appBar: customAppBar(
                  title: "Lectures",
                  leadingIcon: Icons.arrow_back_ios,
                  leadingIconColor: Colors.deepOrange,
                  actionIcon: Icons.filter_list,
                  context: context,
                needAction: true,
                leadingOnPressed: (){
                //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeLayout_Screen(),), (route) => false);
                  Navigator.pop(context);
                }

              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                child: ConditionalBuilder(
                  condition: myCubit.modelData!=null,
                  builder: (context) => ListView.builder(
                      physics: const BouncingScrollPhysics(),

                      itemBuilder: (context, index) => customCard(
                        lectureName: "${myCubit.modelData!.data![index].lectureSubject}",
                        lectureDate: "${myCubit.modelData!.data![index].lectureDate}",
                        lectureStartTime: "${myCubit.modelData!.data![index].lectureStartTime}",
                        lectureEndTime: "${myCubit.modelData!.data![index].lectureEndTime}",
                      ),
                      itemCount:
                      LectureCubit.get(context).modelData!.data!.length),
                  fallback: (context) => const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
                ),
              )
          );
        },
      ),
    );
  }
}
