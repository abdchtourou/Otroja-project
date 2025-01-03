import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaSuccessDialog extends StatelessWidget {
  String text;
  OtrojaSuccessDialog({super.key, required this.text,this.onPressed});
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30.0.h),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 9.h, top: 20.h),
                child: Image.asset(
                  'assets/icons/successIcon.png',
                  scale: 3.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12.4.h, top: 9.h),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity, // Makes the Button stretch horizontally
                decoration: const BoxDecoration(
                  color: Color(0xFF85313C),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(30, 30),
                    bottomLeft: Radius.elliptical(30, 30),
                  ),
                ),
                child: TextButton(
                  onPressed: onPressed ?? () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "عودة",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )

    ;
  }
}
