///Abstract Class
abstract class SignUpState {}
///Start State
class SignUpInitial extends SignUpState {}
///Sign Up
class SignUpLoadingState extends SignUpState {}
class SignUpSuccessState extends SignUpState {}
class SignUpErrorState extends SignUpState {}
///
class SignUpVisiblePasswordState extends SignUpState {}
class SignUpVisibleConfirmPasswordState extends SignUpState {}
/////////////////////////////////////////////////////
class SignUpChangeGenderState extends SignUpState {}
class SignUpChangeGradeState extends SignUpState {}
class SignUpChangeUniversityState extends SignUpState {}
//////////////////////////////////////////////////////////////////////
class SignUpGetUniversityLoadingState extends SignUpState {}
class SignUpGetUniversitySuccessState extends SignUpState {}
class SignUpGetUniversityErrorState extends SignUpState {}
