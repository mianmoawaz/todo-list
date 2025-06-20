import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/view/auth/signin_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDEDED),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                  height: 250,
                  width: 400,
                  color: AppColors.green,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 290),
                          child: GestureDetector(
                            onTap: () {
                              ();
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50.r,
                              backgroundColor: AppColors.green,
                              backgroundImage: AssetImage(''),
                            ),
                            // CircleAvatar(
                            //   radius: 50.r,
                            //   backgroundColor: AppColors.white.withOpacity(.5),
                            //   child: Center(
                            //     child: Icon(Icons.add_photo_alternate,
                            //         size: 30, color: AppColors.white),
                            //   ),
                            // ),
                          ],
                        ),
                      ])),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 260, top: 10),
                      child: Text(
                        'edit text',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.green),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 55,
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Icon(Icons.edit),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 55,
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: emailcontroller,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 260),
                      child: Text('more',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.green)),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Image.asset('assets/privacy-policy.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Privacy Policy')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Image.asset('assets/terms-and-conditions 2.png'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text('Terms & Conditions'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Image.asset('assets/logout.png'),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(SignInScreen());
                            },
                            child: Text('Logout'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                height: 650,
                width: 400,
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                ),
              )
            ],
          ),
        ));
  }
}
