import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentPointItem extends StatelessWidget {
  final int value;
  final String date;
  final String text;

  const StudentPointItem({
    super.key,
    required this.value,
    required this.date,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF85313C), width: 2.w),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(color: Color(0xFF85313C)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      "assets/icons/calendar(2).png",
                      scale: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text("$value / 100"),
                     Expanded(child: Container()),
                      Text(
                        text,
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(9),
                    value: value / 100,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF85313C)),
                    minHeight: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}