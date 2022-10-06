import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View/Components/core/AppBar/AppBar.dart';
import 'package:orange/View_Model/Bloc/FaqModel/faq_cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';

class faq_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getFaqData(),
      child: BlocConsumer<FaqCubit, FaqState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          FaqCubit myCubit=FaqCubit.get(context);
          return  Scaffold(
            appBar:customAppBar(title: "FAQ", context: context,leadingOnPressed: (){Navigator.pop(context);},leadingIcon: Icons.arrow_back_ios,leadingIconColor: Colors.black,),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ConditionalBuilder(condition:myCubit.modelData!=null , builder: (context) => Column(
                children: [
                  InkWell(
                    onTap: () {
                    myCubit.changeSelected();
                    },
                    child: AnimatedContainer(
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.only(topLeft: Radius
                            .circular(20), topRight: Radius.circular(20)),
                      ),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:  [
                            Expanded(
                              child:HTML.toRichText(
                                context,
                                "${myCubit.modelData!.data![0].question}",
                                defaultTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  // etc etc
                                ),
                              ),

                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    width: double.infinity,
                    height: myCubit.selected ? 0 : 70,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child:  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HTML.toRichText(
                          context,
                          "${myCubit.modelData!.data![0].answer}",
                          defaultTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            // etc etc
                          ),
                        ),

                      ),
                    ),

                  ),

                ],
              ), fallback:(context) => const Center(child: CircularProgressIndicator(
                color: Colors.deepOrange,
              )) )
            ),

          );
        },
      ),
    );
  }
}
