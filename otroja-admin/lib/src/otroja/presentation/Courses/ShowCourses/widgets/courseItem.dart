import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/Courses/ShowCourses/widgets/CourseItemBody.dart';
import 'package:admins/src/otroja/presentation/Courses/ShowCourses/widgets/courseItemHeader.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItem extends StatelessWidget {
  String courseName;
  String startDate;
  String levels;
  VoidCallback onTap;
  CourseItem(
      {super.key,
      required this.courseName,
      required this.startDate,
      required this.levels,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: OtrojaColors.primaryColor,
                width: 2,
              )),
          child: Column(
            children: [
              CourseItemHeader(
                courseName: courseName,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CourseItemBody(
                  startDate: startDate,
                  levels: levels,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
