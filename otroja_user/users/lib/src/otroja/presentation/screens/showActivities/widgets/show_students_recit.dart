import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/student_to_do/student_to_do_cubit.dart';
import '../../../../cubits/student_to_do/student_to_do_state.dart';
import '../../../widgets/otroja_app_bar.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';
import 'studentsListRecit.dart';

class ShowStudents extends StatelessWidget {
  ShowStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "حدد الطالب ",
        secText: "اختر طالباً لبدأ التسميع",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<StudentCubit, StudentState>(
                builder: (context, state) {
                  if (state is StudentLoading) {
                    return const Center(
                        child: OtrojaCircularProgressIndicator());
                  } else if (state is StudentLoaded) {
                    return StudentsList(
                      context: context,
                      students: state.students,
                    );
                  } else {
                    return const Center(child: Text("Error loading students"));
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
