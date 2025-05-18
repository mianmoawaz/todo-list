import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/constant/app_icon.dart';
import 'package:todo_list/user/detail_screen.dart';
import 'package:todo_list/user/home_screen.dart';
import 'package:todo_list/widget/button/common_button.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.only(top: 60, right: 300),
            child: GestureDetector(
              onTap: () {
                Get.to(DetailScreen());
              },
              child: Icon(
                AppIcons.back,
                size: 30,
              ),
            )),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: TextField(
            controller: titlecontroller,
            decoration: InputDecoration(
              hintText: "Enter text here...",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Divider(
            thickness: 2,
            color: AppColors.green,
          ),
        ),
        SizedBox(
          height: 29.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: TextField(
            controller: descriptioncontroller,
            decoration: InputDecoration(
              hintText: "Enter text here...",
              border: InputBorder.none,
            ),
          ),
        ),
        ComonButton(
            title: "Update",
            // isLoding: todocontroller.isloading.value,
            onTap: () {
              Get.to(HomeScreen());
            })
      ]),
    );
  }
}
