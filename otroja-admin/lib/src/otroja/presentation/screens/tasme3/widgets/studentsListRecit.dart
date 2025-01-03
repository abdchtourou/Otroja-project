import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../cubit/standardCubit/standard_cubit.dart';

class StudentsListRecit extends StatelessWidget {
  StudentsListRecit({
    super.key,
    required this.context,
    required this.students,
  });

  final BuildContext context;
  final List<ShowStudentModel> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return UserCard(
            name: "${student.firstName} ${student.lastName}",
            imagePath: "assets/images/kidsNew.png",
            iconPath: "assets/icons/return.png",
            onItemPressed: () {
              context.read<StandardCubit>().studentId = student.id!;
              context.pushNamed(Routes.tasmeaa);
            });
      },
    );
  }
}
