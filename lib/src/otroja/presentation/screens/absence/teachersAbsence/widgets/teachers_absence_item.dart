import 'package:admins/src/otroja/cubit/absecne_staff/absence_staff_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/absence/studentsAbsence/widget/is_absence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/students/check_student/check_student_cubit.dart';
import '../../studentsAbsence/widget/checked.dart';

class TeachersAbsenceItem extends StatelessWidget {
  bool absence;
  VoidCallback onTap;
  String groupName;
  String teachersName;
  int index;
  int isAbsence;

  TeachersAbsenceItem({
    super.key,
    required this.absence,
    required this.onTap,
    required this.groupName,
    required this.teachersName,
    required this.index,
    required this.isAbsence,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AbsenceStaffCubit>();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 28.0.w),
                    child: InkWell(
                      onTap: () {
                        cubit.togglePresence(index, false);
                        cubit.addAbsence(
                        1, false);
                      },
                      child: IsAbsence(
                        index: index,
                        isAbsence: cubit.isPresentList[index],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45.w),
                    child: InkWell(
                      onTap: () {
                        cubit.togglePresence(index, true);
                        cubit.addAbsence(
                            1, true);
                      },
                      child: Checked(
                        index: index,
                        isExit: cubit.isPresentList[index],
                      ),
                    ),
                  ),
                ],
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
