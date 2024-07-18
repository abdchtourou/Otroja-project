import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeachersAbsenceTableTitle extends StatelessWidget {
  const TeachersAbsenceTableTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 40.h,
      decoration: const  BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Color.fromARGB(223, 239, 227, 211),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            'اسم الحلقة  ',
            style: TextStyle(
                color: Color(0xff85313C),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(
            ' وأستاذها',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
          SizedBox(
            width: 50.w,
          ),
          Text(
            'حاضر',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
          SizedBox(
            width: 40.w,
          ),
          Text(
            'غائب',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
