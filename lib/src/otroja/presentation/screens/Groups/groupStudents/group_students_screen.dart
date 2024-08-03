import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import 'package:admins/src/otroja/presentation/screens/Groups/groupStudents/widgets/add_dialog.dart';
import 'package:admins/src/otroja/presentation/screens/Groups/groupStudents/widgets/groupStudentsList.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/otroja_circular_progress_indicator.dart';

class GroupStudentsScreen extends StatelessWidget {
  final int groupId;
  const GroupStudentsScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "طلاب الحلقة",
        secText: "لإزالة طالب من الحلقة اضغط على ايقونة الحذف",
        optionalWidget: AddAppBar(
          onTap: () {
            context.pushNamed(Routes.addStudentToGroup).then(
              (_) async {
                final cubit = context.read<ShowStudentsCubit>();
                if(cubit.selectedStudents.isNotEmpty){
                final shouldRemove = await AddDialog.show(context);
                if (shouldRemove) {  
                  cubit.addStudentsToGroup(groupId, cubit.selectedStudents);
                }
                }
              },
            );
          },
        ),
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
                    return const Center(
                        child: OtrojaCircularProgressIndicator());
                  } else if (state is ShowStudentsLoaded) {
                    final students = state.students;
                    return GroupStudentsList(
                      students: students,
                      groupId: groupId,
                    );
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
