import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItemBody extends StatelessWidget {
  String startDate;
  String levels;
  CourseItemBody({super.key, required this.startDate, required this.levels});

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
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        ': تبدأ في ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(
                          startDate,
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
              // Text(
              //   'تعديل',
              //   style: TextStyle(
              //       fontSize: 16,
              //       color: OtrojaColors.primaryColor,
              //       fontWeight: FontWeight.bold),
              // ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded(
                //   flex: 2,
                //   child: Padding(
                //     padding: EdgeInsets.only(right: 5.w, top: 5.h),
                //     child: Row(
                //       textDirection: TextDirection.rtl,
                //       children: [
                //         // Text(
                //         //   ': عدد الحلقات الكلي  ',
                //         //   style: TextStyle(
                //         //       fontWeight: FontWeight.w500, fontSize: 16),
                //         // ),
                //         SizedBox(
                //           width: 5.w,
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(top: 2.h),
                //           child: Text(
                //             '20',
                //             style: TextStyle(
                //                 fontSize: 16,
                //                 color: OtrojaColors.primaryColor,
                //                 fontWeight: FontWeight.w500),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Text("المستويات",
                  style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Spacer(flex: 1,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/courseLevels.png",
                      fit: BoxFit.contain,
                      scale: 1.5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          levels,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 4,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
