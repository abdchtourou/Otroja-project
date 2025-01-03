import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class ExamCard extends StatelessWidget {
  String startDate;
  String examName;
  VoidCallback onTap;

  ExamCard(
      {super.key,
      required this.startDate,
      required this.examName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateResult=startDate.split(" ");
    final time=dateResult[1].split(':');
    final hour="${time[0]}:${time[1]}";
    final date="${dateResult[0]} / $hour";
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff85313C), width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      date,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: OtrojaColors.primaryColor
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset(
                      'assets/icons/calendar(2).png',
                      scale: 25,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color.fromARGB(223, 234, 226, 215),
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                   examName,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
