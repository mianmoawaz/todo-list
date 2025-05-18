import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/constant/app_icon.dart';
import 'package:todo_list/constant/app_images.dart';
import 'package:todo_list/user/addto_list.dart';
import 'package:todo_list/user/home_screen.dart';
import 'package:todo_list/view/auth/forgot_password.dart';
import 'package:todo_list/widget/button/common_button.dart';
import 'package:todo_list/widget/field/common_textfield.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDEDED),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 340, left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      AppIcons.back,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Welcome Back!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Image.asset(AppImages.young),
                SizedBox(
                  height: 15.h,
                ),
                CommonTextfield(
                  hintText: 'Enter your email address',
                  controller: emailcontroller,
                  // validator: (value) {
                  //   // Fixed the validator function
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your email';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 29.h,
                ),
                CommonTextfield(
                  hintText: 'Confirm password',
                  controller: passwordcontroller,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your confirmpassword';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Forgotpassword()));
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.green),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ComonButton(
                    title: 'sign in',
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      Get.to(HomeScreen());
                      // }
                    }),
                Row(
                  children: [
                    Text(
                      '                       Dont have an account ?',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                    SizedBox(
                      height: 41.h,
                    ),
                    Text(
                      'sign up',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.green),
                    ),
                  ],
                )
              ]),
            )));
  }
}
