import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View/Pages/Home_Page/Home.dart';
import 'package:orange/View_Model/Bloc/SignIn_Cubit/sign_in_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../View_Model/Bloc/SignIn_Cubit/sign_in_state.dart';
import '../../../View_Model/Database/Local/CacheHelper.dart';
import '../../../constant.dart';
import '../HomeLayout_Page/HomeLayout.dart';
import '../../Components/core/App_name/app_name.dart';
import '../../Components/core/Button/Button.dart';
import '../../Components/core/OR/OR.dart';
import '../../Components/core/TextFormField/TextFormField.dart';
import '../SignUp_Page/Sign_up_Page.dart';

class SignIn_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            CacheHelper.saveData(
                    key: "token", value: state.loginModel.data!.accessToken)
                .then((value) {
              token = state.loginModel.data!.accessToken;
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeLayout_Screen(),), (route) => false);
              showTopSnackBar(
                context,
                const CustomSnackBar.success(
                  message: "Welcome Back",
                ),
              );
            });
          }
          if (state is SignInErrorState) {
            showTopSnackBar(
              context,
              const CustomSnackBar.error(
                message: "E_mail or Password is incorrect",
              ),
            );
            Navigator.pop(context);

          }
          if (state is SignInLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                content: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
              ),
              barrierDismissible: false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10, right: 20, left: 20,),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Center(
                    child: Form(
                      key: SignInCubit.get(context).formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Orange Digital Center Header.
                          customAppName(fontSize: 25),
                          const SizedBox(height: 60,),
                          // Sign In text.
                          const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,),),
                          const SizedBox(height: 15,),
                          // ListView for textFormFields.
                          customTextFormField(labelText: "E_Mail", onTaP: () {}, controller: SignInCubit.get(context).emailController, validationText: "please enter your E-Mail"),
                          const SizedBox(height: 15,),
                          customTextFormField(labelText: "Password", suffixIcon:SignInCubit.get(context).obscureText? Icons.visibility_off:Icons.visibility, controller: SignInCubit.get(context).passwordController, validationText: "Please Enter your Password",obscureText:SignInCubit.get(context).obscureText,suffixIconOnTap: (){SignInCubit.get(context).visible();}),
                          //Forgot password
                          TextButton(onPressed: () {}, child: const Text("Forgot Password", style: TextStyle(color: Colors.deepOrange, decoration: TextDecoration.underline,),),),
                          ///Sign In Button
                          customButton(text: "Login", onTap: () {if (SignInCubit.get(context).formKey.currentState!.validate()) {SignInCubit.get(context).sigIn();}}),
                          const SizedBox(height: 20,),
                          //Row or
                          customOr(),
                          const SizedBox(height: 20,),
                          ///Sign Up Button
                          Container(height: 50, width: double.infinity, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.deepOrange),),
                            child: customButton(text: "Sign Up", buttonColor: Colors.white, textColor: Colors.deepOrange, onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUpScreen()));
                            }),
                          ),
                        ],
                      ),
                    ),
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
