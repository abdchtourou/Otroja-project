import 'package:admins/src/otroja/presentation/screens/absence/studentsAbsence/widget/is_absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../studentsAbsence/widget/checked.dart';

class TeachersAbsenceItem extends StatelessWidget {
  bool absence;
  VoidCallback onTap;
  String groupName;
  String teachersName;
int index;
int isAbsence;

  TeachersAbsenceItem(
      {super.key,
      required this.absence,
      required this.onTap,
      required this.groupName,
      required this.teachersName,
        required this.index,
        required this.isAbsence,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 70.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 0,
            child: Divider(
              color: Color(0xff85313C),
              thickness: 1.5,
              indent: 0,
              endIndent: 0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Padding(
                padding:  EdgeInsets.only(right: 40.0.w),
                child: IsAbsence(index: index,  isAbsence: isAbsence,),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 45.w,top: 0.h),
                child: Checked(index: index, isExit: isAbsence),
              ),



              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 6),
                    width: 160.w,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xff85313C),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        groupName,
                        style: const TextStyle(
                            color: Color(0xffEFEBE6),
                            fontStyle: FontStyle.normal,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, right: 20.w),
                    child: Text(
                      teachersName,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
