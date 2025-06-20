import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/constant/app_icon.dart';
import 'package:todo_list/constant/app_images.dart';
import 'package:todo_list/controller/authcontroller.dart';
import 'package:todo_list/view/auth/forgot_password.dart';
import 'package:todo_list/view/auth/signup_screen.dart';
import 'package:todo_list/widget/button/common_button.dart';
import 'package:todo_list/widget/field/common_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final Authcontroller authcontrollers = Authcontroller();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 324, top: 22, left: 14),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Icon(AppIcons.circle, size: 40.sp),
                ),
              ),
              SizedBox(height: 79.h),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: const EdgeInsets.only(left: 92),
                child: Image.asset(AppImages.young),
              ),
              SizedBox(height: 8.h),
              CommonTextfield(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                hintText: 'Enter your Email address ',
                controller: EmailController,
              ),
              SizedBox(height: 20.h),
              CommonTextfield(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter Confirm Password';
                  }
                  return null;
                },
                hintText: 'Confirm Password',
                controller: PasswordController,
              ),
              SizedBox(height: 45.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Forgotpassword(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    height: 7.h,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Obx(
                () => ComonButton(
                  title: 'Sign In',
                  isLoding: authcontrollers.isloading.value,
                  onTap: () {
                    authcontrollers.signin(
                        _formKey, EmailController, PasswordController);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 35),
                child: Row(
                  children: [
                    Text('Already have an account ? '),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupScreen());
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
