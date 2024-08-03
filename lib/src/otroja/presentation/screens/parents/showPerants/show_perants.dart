import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import 'package:admins/src/otroja/presentation/screens/parents/showPerants/widgets/perants_list.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';

class ShowParentsScreen extends StatelessWidget {

  const ShowParentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: BlocBuilder<ParentCubit, ParentState>(
                builder: (context, state) {
                  if (state is ParentLoading) {
                    return const Center(
                        child: OtrojaCircularProgressIndicator());
                  } else if (state is ParentsLoaded) {
                    final parents = state.parents;
                    return ParentsList(
                      parents: parents,
                    );
                  } else if (state is ParentError) {
                    return const Center(child: Text("Error loading parents"));
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
