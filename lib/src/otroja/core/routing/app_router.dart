import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/activityCubit/show_activity/show_activity_cubit.dart';
import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/screens/add_staff.dart';
import 'package:admins/src/otroja/presentation/screens/student/edit_information_student.dart';
import 'package:admins/src/otroja/presentation/screens/student/student_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/students/add_studnet/add_studnet_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../presentation/screens/activity/showActivities/activityScreen.dart';
import '../../presentation/screens/student/add_student.dart';
import '../../presentation/screens/student/show_students.dart';
import '../di/dependency_injection.dart';
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowActivityCubit>(),
                  child:  ActivityScreen(),
                )
            );
      case Routes.studentDetails:
        final ShowStudentModel? showStudentModel = settings.arguments as ShowStudentModel?;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<ShowStudentsCubit>(),
              child:  StudentDetails(showStudentModel: showStudentModel!,),)
        );
        case Routes.editStudentInfo:
          final studentId=settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<EditInfoStudentCubit>(),
              child:  EditInformationStudent(studentId: studentId,),)
        );



    }
    return null;
  }
}
