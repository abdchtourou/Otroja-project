import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/colors.dart';
class SubjectHeader extends StatelessWidget {
  const SubjectHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 250.w,
      height: 50.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 7.h,
            left: 0,
            child: Container(
              height: 40.h,
              width: 237.w,
              decoration: const BoxDecoration(
                  color: OtrojaColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Center(
                  child: Text(
                    'الفقه الشافعي',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
          ),
          Positioned(
              right: 0,
              // top:1.h,

              child: Container(
                padding: const EdgeInsets.all(6),
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: OtrojaColors.primaryColor),
                    shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/pattern (7) 24.png',
                  fit: BoxFit.contain,
                ),
              ))
        ],
      ),
    );
  }
}
