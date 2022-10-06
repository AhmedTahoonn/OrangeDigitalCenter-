import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../Components/core/App_name/app_name.dart';
import '../signIn_Page/SignIn_Page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customAppName(fontSize: 27),
            const SizedBox(height: 40,),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: LinearPercentIndicator(
                  percent: 1.0,
                  lineHeight: 8.0,
                  animation: true,
                  animationDuration: 1600,
                  barRadius: const Radius.circular(10),
                  progressColor: Colors.deepOrange,
                  onAnimationEnd: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn_Screen()));
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
