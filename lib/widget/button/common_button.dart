import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/constant/app_colors.dart';

class ComonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? isLoding;
  const ComonButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isLoding = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          child: Center(
            child: isLoding == true
                ? CircularProgressIndicator()
                : Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),
          ),
          height: 44.h,
          width: 200.w,
          decoration: BoxDecoration(color: AppColors.green)),
    );
  }
}
