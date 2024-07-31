import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarOptionalHome extends StatelessWidget {
  const AppBarOptionalHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w, // Responsive width
      height: 55.h, // Responsive height
      decoration: BoxDecoration(
        color: const Color(0xaaEEE9E7),
        borderRadius: BorderRadius.circular(15.r), // Responsive radius
        border: Border.all(
          color: OtrojaColors.primaryColor,
          width: 1.5.w, // Responsive border width
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 30.w, // Responsive width
              height: 60.h, // Responsive height
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r), // Responsive radius
                  bottomRight: Radius.circular(12.r), // Responsive radius
                ),
              ),
              child: Image.asset(
                "assets/images/kidsNew.png",
                fit: BoxFit.cover, // Ensure image scales properly
              ),
            ),
          ),
          SizedBox(width: 5.w), // Responsive spacing
          Expanded(
            flex: 2,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
              children: [
                Text(
                  'المشرف',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h), // Adjust spacing
                Text(
                  'يعقوب قمر الدين',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp, // Responsive font size
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
