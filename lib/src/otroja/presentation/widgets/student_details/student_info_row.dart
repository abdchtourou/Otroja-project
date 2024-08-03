import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/studentInfoCubit/student_info_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/routes.dart';
import '../../../data/models/stuednt_info.dart';
import 'custom_container.dart';
import 'package:flutter/material.dart';

class StudentInfoRow extends StatelessWidget {
  const StudentInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentInfoCubit, StudentInfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is StudentInfoLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                imagePath: 'assets/images/exam (2) 1.png',
                text: 'العلامات',
                onTap: () {
                  context.pushNamed(Routes.studentPoints,
                      arguments: state.studentInfo.results);
                },
              ),
              CustomContainer(
                imagePath: 'assets/images/user (1) 1.png',
                text: 'الحضور',
                onTap: () {
                  context.pushNamed(Routes.studentAbsencsByGroup,
                      arguments: state.studentInfo.absences);
                },
              ),
            ],
          );
        } else if (state is StudentInfoLoading) {
          return OtrojaCircularProgressIndicator();
        } else {
          return Text("error loading student info");
        }
      },
    );
  }
}
