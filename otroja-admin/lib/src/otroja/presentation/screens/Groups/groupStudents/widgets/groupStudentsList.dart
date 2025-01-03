import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/presentation/screens/Groups/groupStudents/widgets/RemoveConfirmationDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';

class GroupStudentsList extends StatelessWidget {
  final List<ShowStudentModel> students;
  final int groupId;

  const GroupStudentsList({
    Key? key,
    required this.students,
    required this.groupId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return UserCard(
          name: "${student.firstName} ${student.lastName}",
          imagePath: "assets/images/kidsNew.png",
          iconPath: "assets/icons/cancel.png",
          onItemPressed: () {
            context.pushNamed(Routes.studentDetails, arguments: student);
          },
          onIconPressed: () async {
            final shouldRemove =
                await RemoveStudentDialog.show(context, student);
            if (shouldRemove) {
              context
                  .read<ShowStudentsCubit>()
                  .removeStudentFromGroup(student.id, groupId);
            }
          },
        );
      },
    );
  }
}
