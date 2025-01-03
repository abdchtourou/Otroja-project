import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/colors.dart';

class LevelCard extends StatelessWidget {
  String level;
  VoidCallback onTap;
  LevelCard({super.key, required this.level, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/islamic 1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Transform.rotate(
            angle: -3.14 / 4,
            child: Container(
              width: 100.w,
              height: 90.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 236, 224),
                border: Border.all(width: 3, color: OtrojaColors.primaryColor),
              ),
              child: Center(
                child: Transform.rotate(
                  angle: 3.14 / 4,
                  child: Text(
                    ' المستوى : $level ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
