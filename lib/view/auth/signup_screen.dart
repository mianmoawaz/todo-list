import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/constant/app_icon.dart';
import 'package:todo_list/controller/authcontroller.dart';
import 'package:todo_list/view/auth/onboarding.dart';
import 'package:todo_list/view/auth/signin_screen.dart';
import 'package:todo_list/widget/button/common_button.dart';
import 'package:todo_list/widget/field/common_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final Authcontroller authController = Get.put(Authcontroller());

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: authController.formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 324, top: 32, left: 14),
                child: GestureDetector(
                    onTap: () {
                      Get.to(Onboarding());
                    },
                    child: Icon(
                      AppIcons.back,
                      size: 40.sp,
                    )),
              ),
              SizedBox(
                height: 79.h,
              ),
              Text(
                'Welcome Onboard!',
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text('Let’s help you meet up your task',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 19.5.sp,
                  )),
              SizedBox(
                height: 30.h,
              ),
              CommonTextfield(
                validator: (Value) {
                  if (Value == '' || Value == null) {
                    return 'please enter your full name';
                  }
                  return null;
                },
                hintText: 'Enter your Full Name',
                controller: authController.name,
              ),
              SizedBox(
                height: 25.h,
              ),
              CommonTextfield(
                validator: (Value) {
                  if (Value == '' || Value == null) {
                    return "please enter your email address";
                  }
                  return null;
                },
                hintText: 'Enter your Email address',
                controller: authController.email,
              ),
              SizedBox(
                height: 25.h,
              ),
              CommonTextfield(
                validator: (Value) {
                  if (Value == '' || Value == null) {
                    return 'please enter your password';
                  }
                  return null;
                },
                hintText: 'Create a Password',
                controller: authController.password,
              ),
              SizedBox(
                height: 26.h,
              ),
              SizedBox(
                height: 98.h,
              ),
              Obx(
                () => ComonButton(
                    title: 'signup',
                    isLoding: authController.isloading.value,
                    onTap: () => authController.signup()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 40),
                child: Row(
                  children: [
                    Text('Already have an account ? '),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => SignInScreen());
                          isloading = false;
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future signup() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       setState(() {
  //         isloading = true;
  //       });
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: emailcontroller.text, password: passwordcontroller.text);
  //       Get.to(HomeScreen());
  //     } catch (e) {
  //       Get.snackbar('error', e.toString());
  //     } finally {
  //       setState(() {
  //         isloading = false;
  //       });
  //     }
  //   }
  // }
}
