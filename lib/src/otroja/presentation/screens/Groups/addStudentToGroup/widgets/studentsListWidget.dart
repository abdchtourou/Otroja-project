import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StudentsListWidget extends StatelessWidget {
  const StudentsListWidget({
    super.key,
    required this.context,
    required this.students,
    required this.selectedStudents,
  });

  final BuildContext context;
  final List<ShowStudentModel> students;
  final List<int> selectedStudents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        final isSelected = selectedStudents.contains(student.id);
        return UserCard(
          name: "${student.firstName} ${student.lastName}",
          imagePath: "assets/images/kidsNew.png",
          iconPath: isSelected ? "assets/icons/minus.png" 
          : "assets/icons/add.png",
          onPressed: () {
            context.read<ShowStudentsCubit>().toggleSelection(student.id!);
          },
        );
      },
    );
  }
}