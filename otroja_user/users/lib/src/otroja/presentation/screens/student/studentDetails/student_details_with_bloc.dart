import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/otroja/cubits/studentInfoCubit/student_info_cubit.dart';
import 'package:otroja_users/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';

import 'student_details.dart';

class StudentDetailsWithBloc extends StatelessWidget {
  const StudentDetailsWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentInfoCubit, StudentInfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is StudentInfoLoaded) {
          return StudentDetails(
            studentInfo: state.studentInfo,
          );
        } else if (state is StudentInfoLoading) {
          return Scaffold(body: OtrojaCircularProgressIndicator());
        } else {
          return Scaffold(body: Text("error loading student"));
        }
      },
    );
  }
}
