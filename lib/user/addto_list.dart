import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/constant/app_colors.dart';
import 'package:todo_list/constant/app_icon.dart';
import 'package:todo_list/user/home_screen.dart';
import 'package:todo_list/view/auth/signin_screen.dart';
import 'package:todo_list/widget/button/common_button.dart';
import 'package:todo_list/widget/field/common_textfield.dart';

class AddtoList extends StatefulWidget {
  const AddtoList({super.key});

  @override
  State<AddtoList> createState() => _AddtoListState();
}

class _AddtoListState extends State<AddtoList> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEDEDED),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formkey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 300),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SignInScreen());
                    },
                    child: Row(
                      children: [
                        Icon(
                          AppIcons.back,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 65.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Add new todo!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 45.h,
                ),
                Image.asset('assets/Girl and boy sitting with laptop.png'),
                SizedBox(
                  height: 41.h,
                ),
                Text(
                  'Add What your want to do later on..',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green),
                ),
                SizedBox(
                  height: 41.h,
                ),
                CommonTextfield(
                  hintText: 'title',
                  controller: titlecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 26.h,
                ),
                CommonTextfield(
                  hintText: 'description',
                  controller: descriptioncontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                ComonButton(title: 'add to list', onTap: () => addto())
              ]),
            )));
  }

  Future addto() async {
    if (_formkey.currentState!.validate()) {
      try {
        setState(() {
          isloading = true;
        });
        Get.to(HomeScreen());
        isloading = false;
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isloading = false;
      }
    }
  }
}
