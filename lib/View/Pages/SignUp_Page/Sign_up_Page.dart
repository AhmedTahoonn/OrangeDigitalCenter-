import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View/Components/core/App_name/app_name.dart';
import 'package:orange/View/Components/core/Button/Button.dart';
import 'package:orange/View/Components/core/OR/OR.dart';
import 'package:orange/View/Components/core/TextFormField/TextFormField.dart';
import 'package:orange/View_Model/Bloc/SignUp_Cubit/sign_up_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../Models/UniversityModel/unviersity.dart';
import '../../../View_Model/Bloc/SignUp_Cubit/sign_up_state.dart';
import '../../Components/Sign Up/DropDownButton/DropDownButton.dart';
import '../signIn_Page/SignIn_Page.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            showTopSnackBar(
              context,
              const CustomSnackBar.success(
                message: "Successfully SignUp ",
              ),
            );
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SignIn_Screen(),
                ),
                (route) => false);
          }
          if (state is SignUpErrorState) {
            showTopSnackBar(
              context,
              const CustomSnackBar.error(
                message: "Some Thing Wrong",
              ),
            );
          }
        },
        builder: (context, state) {
          SignUpCubit myCubit = SignUpCubit.get(context);
          return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 10, right: 20, left: 20,),
                    child: Form(
                      key: SignUpCubit.get(context).formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Orange Digital Center Header.
                          customAppName(fontSize: 25),
                          const SizedBox(
                            height: 60,
                          ),
                          // Sign Up text.
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // ListView for textFormFields.
                          customTextFormField(
                              labelText: "Name",
                              controller: SignUpCubit.get(context).nameController,
                              validationText: "Please enter your name"),
                          const SizedBox(
                            height: 20,
                          ),
                          customTextFormField(
                              labelText: "E_Mail",
                              controller:
                              SignUpCubit.get(context).emailController,
                              validationText: "please enter your e_mail"),
                          const SizedBox(
                            height: 20,
                          ),
                          customTextFormField(
                              labelText: "Password",
                              suffixIcon:
                              SignUpCubit.get(context).obscureTextPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              controller:
                              SignUpCubit.get(context).passwordController,
                              validationText: "please enter your password",
                              obscureText:
                              SignUpCubit.get(context).obscureTextPassword,
                              suffixIconOnTap: () {
                                SignUpCubit.get(context).visiblePassword();
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          customTextFormField(
                              labelText: "Confirm Password",
                              suffixIcon:
                              SignUpCubit.get(context).obscureConfirmPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              controller: SignUpCubit.get(context)
                                  .confirmPasswordController,
                              validationText: "please enter your password",
                              obscureText:
                              SignUpCubit.get(context).obscureConfirmPassword,
                              suffixIconOnTap: () {
                                SignUpCubit.get(context).visibleConfirmPassword();
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          customTextFormField(
                              labelText: "Phone Number",
                              controller:
                              SignUpCubit.get(context).phoneController,
                              validationText: "please enter your phone"),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customDropDownButton(
                                  text: "Gender",
                                  dropdownValue: SignUpCubit.get(context)
                                      .dropdownValueGender,
                                  items: SignUpCubit.get(context).gender,
                                  onchange: (value) {
                                    SignUpCubit.get(context)
                                        .changeGenderValue(value);
                                  }),
                              customDropDownButton(
                                  text: "University",
                                  dropdownValue: SignUpCubit.get(context)
                                      .dropdownValueUniversity,
                                  items: SignUpCubit.get(context).university,
                                  onchange: (value) {
                                    SignUpCubit.get(context)
                                        .changeUniversityValue(value);
                                  }),
                            ],
                          ),
                          Center(
                            child: customDropDownButton(
                                text: "Grade",
                                dropdownValue:
                                SignUpCubit.get(context).dropdownValueGrade,
                                items: SignUpCubit.get(context).grade,
                                onchange: (value) {
                                  SignUpCubit.get(context)
                                      .changeGradeValue(value);
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          ///Sign Up Button
                          customButton(
                              text: "Sign Up",
                              onTap: () {
                                if (SignUpCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  SignUpCubit.get(context).signUp();
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          //Row or
                          customOr(),
                          const SizedBox(
                            height: 20,
                          ),

                          ///Sign In Button
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.deepOrange),
                            ),
                            child: customButton(
                                text: "Sign In",
                                textColor: Colors.deepOrange,
                                buttonColor: Colors.white,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn_Screen(),
                                      ));
                                }),
                          ),
                        ],
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

