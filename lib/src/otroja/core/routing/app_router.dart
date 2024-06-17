import 'package:admins/src/otroja/presentation/sreens/student/add_student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../presentation/sreens/student/show_students.dart';
import '../di/dependency_injection.dart';
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child: const ShowStudents(),
                )
            );
      case'showStudent':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<ShowStudentsCubit>(),
              child: const AddStudent(),
            )
        );


    }
    return null;
  }
}
