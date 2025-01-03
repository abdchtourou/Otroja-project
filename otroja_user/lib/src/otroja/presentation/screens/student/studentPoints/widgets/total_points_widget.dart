import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'total_points_circular_progress_indicator.dart';

class TotalPointsWidget extends StatelessWidget {
  const TotalPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF85313C), width: 2.w),
            borderRadius: BorderRadius.circular(9)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              TotalPointsCircularProgressIndicator(),
              Expanded(child: Container()),
              Column(
                children: [
                  Text(
                    "المعدل الكلي",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("80/100",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
