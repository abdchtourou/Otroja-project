import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import 'package:otroja_users/src/otroja/data/models/stuednt_info.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../cubits/studentInfoCubit/student_info_cubit.dart';
import '../../../../widgets/otroja_circular_progress_indicator.dart';
import 'custom_container.dart';
import 'package:flutter/material.dart';

class StudentInfoRow extends StatelessWidget {
  StudentInfo studentInfo;
   StudentInfoRow({super.key,required this.studentInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomContainer(
          imagePath: 'assets/images/exam (2) 1.png',
          text: 'العلامات',
          onTap: () {
            context.pushNamed(Routes.studentPoints,
                arguments: studentInfo.results);
          },
        ),
        CustomContainer(
          imagePath: 'assets/images/user (1) 1.png',
          text: 'الحضور',
          onTap: () {
            context.pushNamed(Routes.studentAbsencsByGroup,
                arguments:studentInfo.absences);
          },
        ),
      ],
    );
  }
}
