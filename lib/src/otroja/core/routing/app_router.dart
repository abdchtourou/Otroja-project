import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/students/add_studnet/add_studnet_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../presentation/screens/student/add_student.dart';
import '../../presentation/screens/student/show_students.dart';
import '../di/dependency_injection.dart';
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child:  ShowStudents(),
                )
            );
      case'':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<ShowStudentsCubit>(),
              child:  ShowStudents(),)
        );


    }
    return null;
  }
}
