import 'package:clipboard/clipboard.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/View/Components/core/AppBar/AppBar.dart';
import 'package:orange/View/Components/core/App_name/app_name.dart';
import 'package:orange/View_Model/Bloc/News_Cubit/news_cubit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'New_App_Details.dart';

class news_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => NewsCubit()..getNewsData(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            NewsCubit myCubit=NewsCubit.get(context);
            return Scaffold(
              appBar:  customAppBar(title: "News",context: context),
              body:ConditionalBuilder(
                condition: myCubit.modelData != null,
                builder: (context) => ListView.builder(itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => New_App_Details(
                        body: myCubit.modelData!.data![index].body!,
                        title:  myCubit.modelData!.data![index].title!,
                        date:myCubit.modelData!.data![index].date! ,),));

                    },
                    child: Container(
                      width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Stack(
                          children:
                          [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:
                                  [
                                    Text("${myCubit.modelData!.data![index].title}",style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Container(
                                      width: 80,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children:
                                        [
                                          InkWell(
                                              onTap: (){
                                                Share.share(
                                                    '${myCubit.modelData!.data![index].linkUrl}');

                                              },
                                              child: SvgPicture.asset('assets/icons/share.svg',height: 25,color: Colors.white,)),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0,left: 5),
                                            child: Container(
                                              width: 1,
                                              height: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                FlutterClipboard.copy(
                                                    '${myCubit.modelData!.data![index].linkUrl}')
                                                    .then((value) {
                                                  showTopSnackBar(
                                                    context,
                                                    const CustomSnackBar.info(
                                                      message:
                                                      "copied",
                                                    ),
                                                  );
                                                }
                                                );
                                              },
                                              child: SvgPicture.asset('assets/icons/copy.svg',height: 25,color: Colors.white,)),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                customAppName(fontSize:28),
                                Text("${myCubit.modelData!.data![index].body}",style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),itemCount:myCubit.modelData!.data!.length,),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            );

          },
        ),
      );
  }
}
