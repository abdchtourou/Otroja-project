import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItemHeader extends StatelessWidget {
  String courseName;
  CourseItemHeader({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: OtrojaColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        height: 40.h,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
              child: Image.asset("assets/icons/sujud (1).png"),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 95.w, bottom: 10.h),
                child: Text(
                  'يشفعن',
                  style: TextStyle(
                      color: OtrojaColors.primary2Color,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 2.h, bottom: 2.h),
              child: Image.asset("assets/icons/sujud (1).png"),
            ),
          ],
        ));
  }
}
