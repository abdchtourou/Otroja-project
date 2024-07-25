import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/students/check_student/check_student_cubit.dart';

class IsAbsence extends StatelessWidget {
  IsAbsence({super.key, required this.index, required this.isAbsence});

  int index;
  int isAbsence;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CheckStudentCubit>().togglePresence(index, false);
        context.read<CheckStudentCubit>().addAbsence(index);
        print(context
            .read<CheckStudentCubit>()
            .isAbsence
        );
      },
      child: Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff85313C),
              width: 2,
            ),
          ),
          child: isAbsence == 2
              ? Icon(Icons.close,color: Colors.red,size: 30,)
              : const Text('')
      ),
    );
  }
}
