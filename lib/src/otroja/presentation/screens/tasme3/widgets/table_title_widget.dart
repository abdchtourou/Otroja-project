import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableTitleWidget extends StatelessWidget {
  const TableTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 40.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Color.fromARGB(223, 239, 227, 211),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            'الاسم  ',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            width: 170.w,
          ),
          Text(
            'مرات تكراره',
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
