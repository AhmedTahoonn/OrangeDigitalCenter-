import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../View_Model/Bloc/Terms_Cubit/terms_cubit.dart';
import '../../Components/core/AppBar/AppBar.dart';

class terms_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getTermsData(),
      child: BlocConsumer<TermsCubit, TermsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          TermsCubit myCubit=TermsCubit.get(context);
          return Scaffold(
            appBar: customAppBar(title: "Term & Conditions", context: context, leadingIcon: Icons.arrow_back_ios, leadingIconColor: Colors.black, leadingOnPressed: (){Navigator.pop(context);}),
            body:ConditionalBuilder(builder: (context) => Padding(
              padding: const EdgeInsets.only(right: 15.0,left: 15,top: 15),
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HTML.toRichText(
                            context,
                            "${myCubit.modelData!.data!.terms}",
                            defaultTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,

                              // etc etc
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ), condition: myCubit.modelData!=null, fallback: (context) => const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),),
          );
        },
      ),
    );
  }
}
