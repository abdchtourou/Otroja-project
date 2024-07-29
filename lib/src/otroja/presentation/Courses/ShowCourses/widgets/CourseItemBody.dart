import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItemBody extends StatelessWidget {
  const CourseItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.h, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset("assets/icons/calendar(2).png")),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        ': تنتهي في ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(
                          '1 / 5 / 2002',
                          style: TextStyle(
                              fontSize: 16,
                              color: OtrojaColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'تعديل',
                style: TextStyle(
                    fontSize: 16,
                    color: OtrojaColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.w, top: 5.h),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          ': عدد الحلقات الكلي  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Text(
                            '20',
                            style: TextStyle(
                                fontSize: 16,
                                color: OtrojaColors.primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                          width: 80.w,
                          height: 80.h,
                          child: Image.asset("assets/icons/courseLevels.png")),
                      Positioned(
                        left: 22.w,
                        top: 27.5.h,
                        child: Text(
                          '1 2 3',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                        left: 7.5.w,
                        top: 55.h,
                        child: Text(
                          'مستوياتها',
                          style: TextStyle(
                              fontSize: 16,
                                color: OtrojaColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
