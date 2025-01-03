import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import 'package:otroja_users/src/otroja/cubits/show_activity/show_activity_cubit.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../data/models/student_to_do.dart';
import 'user_card.dart';

class StudentsList extends StatelessWidget {
  StudentsList({
    super.key,
    required this.context,
    required this.students,
  });

  final BuildContext context;
  final List<Student> students;

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
              context.read<ShowActivityCubit>().studentId = student.id;
              context.pushNamed(Routes.activity);
            });
      },
    );
  }
}
