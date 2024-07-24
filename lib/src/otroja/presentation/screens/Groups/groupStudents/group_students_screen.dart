import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import 'package:admins/src/otroja/presentation/screens/Groups/groupStudents/widgets/groupStudentsList.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupStudentsScreen extends StatelessWidget {
  final int groupId;
  const GroupStudentsScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    context.read<ShowStudentsCubit>().getStudentsByGroupId(groupId);
    
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "طلاب الحلقة",
        secText: "لإزالة طالب من الحلقة اضغط على ايقونة الحذف",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OtrojaSearchBar(),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<ShowStudentsCubit, ShowStudentsState>(
                builder: (context, state) {
                  if (state is ShowStudentsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ShowStudentsLoaded) {
                    final students = state.students;
                    return GroupStudentsList(students: students ,groupId: groupId,);
                  } else if (state is ShowStudentsError) {
                    return const Center(child: Text("Error loading students"));
                  } else {
                    return const Center(child: Text("Unexpected state"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
