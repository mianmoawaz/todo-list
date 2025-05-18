import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/constant/app_icon.dart';
import 'package:todo_list/user/home_screen.dart';
import 'package:todo_list/user/update_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDEDED),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 10),
            child: GestureDetector(
              onTap: () {
                Get.to(HomeScreen());
              },
              child: Row(
                children: [
                  Icon(
                    AppIcons.back,
                    size: 30,
                  ),
                  SizedBox(
                    width: 330.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(UpdateScreen());
                    },
                    child: Icon(
                      AppIcons.edit,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'dlasjilhdlsials',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
          Text(
            'sjhdjlakhd;wugasjhaslh;f',
          )
        ]));
  }
}
