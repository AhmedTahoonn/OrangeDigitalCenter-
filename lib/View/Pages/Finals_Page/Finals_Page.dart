import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View_Model/Bloc/Final_Cubit/final_cubit.dart';

import '../HomeLayout_Page/HomeLayout.dart';
import '../../Components/core/AppBar/AppBar.dart';
import '../../Components/core/Card/card.dart';
import '../Home_Page/Home.dart';

class Finals_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => FinalCubit()..getFinalData(),
  child: BlocConsumer<FinalCubit, FinalState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    FinalCubit myCubit=FinalCubit.get(context);
    return Scaffold(
      appBar: customAppBar(title: "Finals",leadingIcon: Icons.arrow_back_ios,leadingIconColor: Colors.deepOrange,actionIcon: Icons.filter_list,context: context,
          needAction: true,
          leadingOnPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeLayout_Screen(),), (route) => false);
    }
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
        child:ConditionalBuilder(
          condition: myCubit.modelData!=null,
          builder: (context) => ListView.builder(
              itemBuilder: (context, index) => customCard(
                lectureName: "${myCubit.modelData!.data![index].examSubject}",
                lectureDate: "${myCubit.modelData!.data![index].examDate}",
                lectureStartTime: "${myCubit.modelData!.data![index].examStartTime}",
                lectureEndTime: "${myCubit.modelData!.data![index].examEndTime}",
              ),
              itemCount:
              FinalCubit.get(context).modelData!.data!.length),
          fallback: (context) => const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
        ),
      ),
    );
  },
),
);
  }
}

