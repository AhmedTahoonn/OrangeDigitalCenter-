import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange/Models/LoginModel/loginModel.dart';
import 'package:orange/View_Model/Database/Network/DioHelper.dart';

import '../../../Models/LoginModel/loginModel.dart';
import '../../../Models/LoginModel/loginModel.dart';
import '../../../Models/LoginModel/loginModel.dart';
import '../../../constant.dart';
import '../../Database/Network/EndPoint.dart';
import 'sign_in_state.dart';


class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool obscureText=true;
  var formKey = GlobalKey<FormState>();

  late LoginModel ?loginModel;
  void sigIn()
  {
    emit(SignInLoadingState());
    DioHelper.postData(url: loginEndPoint, data:
    {
    "email":emailController.text,
    "password":passwordController.text,
    }).then((value) {
      loginModel= LoginModel.fromJson(value.data);
      //token=login!.data!.accessToken.toString();
      if (kDebugMode) {
        print(loginModel!.message);
      }
      if (kDebugMode) {
        print(value.data);
      }
      if (kDebugMode) {
        print(token);
      }

      emit(SignInSuccessState(loginModel!));

    }).catchError((error){
      print(error.toString());
      emit((SignInErrorState()));
    });
  }
  void visible()
  {
    obscureText=!obscureText;
    emit(SignInVisibleState());
  }
}
