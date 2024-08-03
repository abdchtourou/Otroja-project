import 'package:admins/src/otroja/cubit/staff/staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/staff_model.dart';

class StaffListWidget extends StatelessWidget {
  StaffListWidget(
      {super.key,
      required this.context,
      required this.staffs,
      required this.selectedStaffs,
      this.onIconTap,
      this.onItemTap});

  final BuildContext context;
  final List<Staff> staffs;
  final List<int> selectedStaffs;
  VoidCallback? onItemTap;
  VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: staffs.length,
      itemBuilder: (context, index) {
        final student = staffs[index];
        final isSelected = selectedStaffs.contains(student.id);
        return UserCard(
          name: "${student.firstName} ${student.lastName}",
          imagePath: "assets/images/kidsNew.png",
          iconPath:
              isSelected ? "assets/icons/minus.png" : "assets/icons/add.png",
          onIconPressed: () {
            context.read<StaffCubit>().toggleSelection(student.id!);
          },
          onItemPressed: () {},
        );
      },
    );
  }
}
