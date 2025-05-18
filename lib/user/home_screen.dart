import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/user/addto_list.dart';
import 'package:todo_list/user/detail_screen.dart';
import 'package:todo_list/user/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();

  Color _getRandomColor() {
    List<Color> colors = [
      AppColors.list3,
      AppColors.list2,
      AppColors.list1,
    ];
    return colors[_random.nextInt(colors.length)];
  }

  String _getRandomTime() {
    int hour = _random.nextInt(12) + 1;
    int minute = _random.nextInt(60);
    String period = _random.nextBool() ? 'AM' : 'PM';
    return '$hour:${minute.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Column(
            children: [
              Container(
                height: 300.h, // Responsive height
                width: 500.h, // Responsive width
                decoration: BoxDecoration(
                  color: AppColors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ProfileScreen());
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.green,
                        radius: 50, // Avatar size
                        backgroundImage: AssetImage(
                          'assets/handsome 2 1.png',
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Space between avatar and text
                    Text(
                      'Welcome Fizayomi',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 250, top: 15),
                      child: Text(
                        'Todo task',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                    ),
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 5),
                              child: Card(
                                color: _getRandomColor(),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(DetailScreen());
                                    },
                                    title: Text(
                                      "Title of your tasks",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "description of your tasks...",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: Text(
                                      _getRandomTime(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                height: 650.h,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.green,
          child: Center(
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          onPressed: () {
            Get.to(AddtoList());
          }),
    );
  }
}
