import '../../../Models/LoginModel/loginModel.dart';

///Abstract class
abstract class SignInState {}
////////////////////////////////////////////////////////////////////////////////
///start state
class SignInInitial extends SignInState {}
////////////////////////////////////////////////////////////////////////////////
///   SignIn
class SignInLoadingState extends SignInState {}
class SignInSuccessState extends SignInState {
  final LoginModel loginModel;
  SignInSuccessState(this.loginModel);
}
class SignInErrorState extends SignInState {}
////////////////////////////////////////////////////////////////////////////////
///Visible
class SignInVisibleState extends SignInState {}
