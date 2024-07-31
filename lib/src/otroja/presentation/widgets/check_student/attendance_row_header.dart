import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendanceRowHeader extends StatelessWidget {
  const AttendanceRowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Color.fromARGB(223, 239, 227, 211),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  'الاسم',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xff85313C),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                'حاضر',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 35, top: 8, bottom: 8, right: 20),
              child: Text(
                'غائب',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
