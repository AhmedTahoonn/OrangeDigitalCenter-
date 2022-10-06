import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orange/View_Model/Bloc/HomeLayout_Cubit/home_layout_cubit.dart';
import '../../../View_Model/Bloc/HomeLayout_Cubit/home_layout_state.dart';


class HomeLayout_Screen extends StatelessWidget {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: HomeLayoutCubit.get(context).screens[HomeLayoutCubit.get(context).currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1),)],),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.grey[100]!,
                    color: Colors.black,
                    tabs:
                    [
                      GButton(icon: Icons.home, text: 'Home', textColor: Colors.deepOrange, leading: SvgPicture.asset('assets/icons/home.svg', width: 25, height: 25, color: HomeLayoutCubit.get(context).currentIndex==0?Colors.deepOrange:Colors.black,),),
                      GButton(icon: CupertinoIcons.news,text: 'News', textColor: Colors.deepOrange, leading: SvgPicture.asset('assets/icons/midterm.svg', width: 25, height: 25, color:HomeLayoutCubit.get(context).currentIndex==1?Colors.deepOrange:Colors.black,),),
                      GButton(icon: Icons.home, text: 'Settings', textColor: Colors.deepOrange, leading: SvgPicture.asset('assets/icons/settings.svg', width: 25, height: 25, color: HomeLayoutCubit.get(context).currentIndex==2?Colors.deepOrange:Colors.black,),),
                    ],
                    selectedIndex: HomeLayoutCubit.get(context).currentIndex,
                    onTabChange: (index) {
                      HomeLayoutCubit.get(context).changBottomNavigationBar(index);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}