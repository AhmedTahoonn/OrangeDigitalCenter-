import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../View/Pages/Home_Page/Home.dart';
import '../../../View/Pages/News_Page/News_Page.dart';
import '../../../View/Pages/Settings_Page/settings_page.dart';
import 'home_layout_state.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());
  static HomeLayoutCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens =
  [
    home_Screen(),
    news_screen(),
    settings_Screen(),
  ];


  void changBottomNavigationBar(index)
  {
    currentIndex=index;
    emit(HomeLayoutChangeBottomNavigationBar());
  }
}
