import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageCountEditorWidget extends StatelessWidget {
  VoidCallback onTap;
  String icon;
   PageCountEditorWidget({super.key,required this.icon , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70.w,
        height: 70.h,
        decoration: const  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          'assets/icons/islam1.png',
        ))),
        child: Center(
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              icon,
              scale: 23,
            ),
          ),
        ));
  }
}
