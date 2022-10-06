import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange/View_Model/Database/Network/EndPoint.dart';

import '../../../Models/LoginModel/loginModel.dart';
import '../../../Models/SignUPModel/SignUpModel.dart';
import '../../../Models/UniversityModel/unviersity.dart';
import '../../Database/Network/DioHelper.dart';
import 'sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  bool obscureTextPassword=true;
  bool obscureConfirmPassword=true;
  var formKey=GlobalKey<FormState>();
  List<String> gender = ['Male', 'Female'];
  List<String> university = ['AUC', 'Cairo', 'ELU', 'GUC', 'Helwan', 'HTI'];
  List<String> grade = ['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4', 'Grade 5'];
  String dropdownValueGender = 'Male';
  String dropdownValueUniversity = 'AUC';
  String dropdownValueGrade = 'Grade 1';
  List<String>?UniversityList;
   CreateUserModel ?userModel;
  UniversityModel ? universityModel;
  void signUp()
  {
    emit(SignUpLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "email":emailController.text,
      "password":passwordController.text,
      "name":nameController.text,
      "phoneNumber":phoneController.text,
      "gender":dropdownValueGender=='Male'?"m":"f",
      "universityId": university.indexWhere((element) => element.contains(dropdownValueUniversity)),
    }).then((value) {
      userModel= CreateUserModel.fromJson(value.data);
      print(userModel!.data!.name);
      print(value.data);
      emit(SignUpSuccessState());
    }).catchError((error){
      print(error.toString());
      emit((SignUpErrorState()));
    });
  }
  void visiblePassword()
  {
    obscureTextPassword=!obscureTextPassword;
    emit(SignUpVisiblePasswordState());
  }
  void visibleConfirmPassword()
  {
    obscureConfirmPassword=!obscureConfirmPassword;
    emit(SignUpVisibleConfirmPasswordState());
  }
  void changeGenderValue(value)
  {
    dropdownValueGender=value;
    emit(SignUpChangeGenderState());
  }
  void changeGradeValue(value)
  {
    dropdownValueGrade=value;
   emit(SignUpChangeGradeState());
  }
  void changeUniversityValue(value)
  {
    dropdownValueUniversity=value;
  emit(SignUpChangeUniversityState());
  }
  
  void getUniversityData()
  {
    emit(SignUpGetUniversityLoadingState());
    DioHelper.getData(url: universityEndPoint).then((value) {
      print(value.data);
      universityModel=UniversityModel.fromJson(value.data);
      emit(SignUpGetUniversitySuccessState());

    }).catchError((error){
      print(error.toString());
      emit(SignUpGetUniversityErrorState());
    });
  }

}
