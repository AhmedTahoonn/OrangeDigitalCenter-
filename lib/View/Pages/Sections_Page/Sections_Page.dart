import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View_Model/Bloc/Section_Cubit/section_cubit.dart';
import '../HomeLayout_Page/HomeLayout.dart';
import '../../Components/core/AppBar/AppBar.dart';
import '../../Components/core/Card/card.dart';
import '../Home_Page/Home.dart';


class Section_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SectionCubit()..getSectionData(),
  child: BlocConsumer<SectionCubit, SectionState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    SectionCubit myCubit=SectionCubit.get(context);
    return Scaffold(
      appBar: customAppBar(title: "Sections",leadingIcon: Icons.arrow_back_ios,leadingIconColor: Colors.deepOrange,actionIcon: Icons.filter_list,context: context,
          needAction: true,
          leadingOnPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeLayout_Screen(),), (route) => false);
          }
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
        child: ConditionalBuilder(
          condition: myCubit.modelData!=null,
          builder: (context) => ListView.builder(
            physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => customCard(
                lectureName: "${myCubit.modelData!.data![index].sectionSubject}",
                lectureDate: "${myCubit.modelData!.data![index].sectionDate}",
                lectureStartTime: "${myCubit.modelData!.data![index].sectionStartTime}",
                lectureEndTime: "${myCubit.modelData!.data![index].sectionEndTime}",
              ),
              itemCount:
              SectionCubit.get(context).modelData!.data!.length),
          fallback: (context) => const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
        ),
      ),
    );
  },
),
);
  }
}
