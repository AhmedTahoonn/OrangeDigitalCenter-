import 'package:flutter/material.dart';
import 'package:orange/View/Pages/SplashScreen_Page/Splash_Screen.dart';
import 'package:orange/View_Model/Database/Local/CacheHelper.dart';
import 'package:orange/View_Model/Database/Network/DioHelper.dart';
import 'View/Pages/SignUp_Page/Sign_up_Page.dart';
import 'constant.dart';
import 'View/Pages/HomeLayout_Page/HomeLayout.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  Widget widget;
    if (token != null) {
      widget = HomeLayout_Screen();
    } else {
      widget = const SplashScreen();
    }
  runApp( MyApp(startScreen: widget,));
}

class MyApp extends StatelessWidget {
  Widget startScreen;
  MyApp({
    required this.startScreen
});
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home:startScreen,
    );
  }
}


