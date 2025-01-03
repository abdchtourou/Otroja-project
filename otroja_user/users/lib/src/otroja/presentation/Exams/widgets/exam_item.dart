import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamItem extends StatelessWidget {
  const  ExamItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF85313C), width: 2.w),
              borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "2/2/2024",
                      style: TextStyle(color: Color(0xFF85313C)),
                    ),
                    SizedBox(width: 5.w,),
                    Image.asset(
                      "assets/icons/calender.png",
                      scale: 20,
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFE6E6E6),
                ),
                Text(" امتحان الشريعة",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
