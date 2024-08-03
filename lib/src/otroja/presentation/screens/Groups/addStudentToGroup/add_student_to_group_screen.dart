import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import 'package:admins/src/otroja/presentation/screens/Groups/addStudentToGroup/widgets/studentsListWidget.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/buttons/otroja_button.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';

class AddStudentToGroupScreen extends StatelessWidget {
  const AddStudentToGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "حدد طلاب الحلقة",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<ShowStudentsCubit, ShowStudentsState>(
                builder: (context, state) {
                  if (state is ShowStudentsLoading) {
                    return const Center(
                        child:
                            OtrojaCircularProgressIndicator());
                  } else if (state is ShowStudentsLoaded) {
                    return StudentsListWidget(
                        context: context,
                        students: state.students,
                        selectedStudents: state is UpdateSelectedStudentState
                            ? (state as UpdateSelectedStudentState)
                                .selectedStudents
                            : []);
                  } else if (state is UpdateSelectedStudentState) {
                    return StudentsListWidget(
                        context: context,
                        students: context.read<ShowStudentsCubit>().studentList,
                        selectedStudents: state.selectedStudents);
                  } else {
                    return const Center(child: Text("Error loading students"));
                  }
                },
              ),
            ),
            // OtrojaButton(text: "إضافة", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
