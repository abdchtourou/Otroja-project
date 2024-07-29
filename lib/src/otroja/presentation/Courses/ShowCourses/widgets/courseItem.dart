import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/Courses/ShowCourses/widgets/CourseItemBody.dart';
import 'package:admins/src/otroja/presentation/Courses/ShowCourses/widgets/courseItemHeader.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 255.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: OtrojaColors.primaryColor,
            width: 2,
          )),
      child: Column(
        children: [
          CourseItemHeader(),
          SizedBox(
            height: 15,
          ),
          Expanded(flex: 3, child: CourseItemBody()),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: OtrojaButton(
                text: 'عرض الدورة',
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
