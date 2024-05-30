import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddButton extends StatelessWidget {
  AddButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.backgroundColor ,
    required this.text ,
    required this.textColor,
  });

  final void Function()? onTap;
  final ImageProvider icon;
  final Color backgroundColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 150.h,
        margin: const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: backgroundColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image(height: 98.h, width: 98.w, image: icon),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image(
                      height: 30.h,
                      width: 30.w,
                      image: const AssetImage("assets/icons/plus.png"),
                    ),
                  ),
              ],
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}