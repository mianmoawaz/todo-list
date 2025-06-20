import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:todo_list/constant/app_icon.dart';
import 'package:todo_list/controller/authcontroller.dart';
import 'package:todo_list/view/auth/signin_screen.dart';
import 'package:todo_list/widget/button/common_button.dart';
import 'package:todo_list/widget/field/common_textfield.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final Authcontroller authController = Get.put(Authcontroller());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: authController.isloading.value,
      child: Scaffold(
        backgroundColor: const Color(0xffEDEDED),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 300),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => SignInScreen());
                    },
                    child: Icon(
                      AppIcons.back,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 65.h),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    'Forgot password!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 35.h),
                Image.asset('assets/Girl and boy sitting with laptop.png'),
                SizedBox(height: 15.h),
                CommonTextfield(
                  hintText: 'Enter your email',
                  controller: authController.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),
                Obx(
                  () => ComonButton(
                    title: 'Reset Password',
                    isLoding: authController.isloading.value,
                    onTap: () => authController.Forgotpassword(
                      _formkey,
                      authController.email,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
