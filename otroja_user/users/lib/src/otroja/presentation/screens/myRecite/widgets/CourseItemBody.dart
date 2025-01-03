import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class CourseItemBody extends StatelessWidget {
  String date;
  int score;
  int page;
  String staffName;
  CourseItemBody(
      {super.key,
      required this.date,
      required this.score,
      required this.page,
      required this.staffName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.h, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(
                          date,
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
            ],
          ),
          Text(
                '${staffName} : الاستاذ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: 5.w,
              ),
              Text(
                '${page} :رقم الصفحة',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: 5.w,
              ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                 "العلامة",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Spacer(
                  flex: 1,
                ),
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
                          "$score",
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
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
