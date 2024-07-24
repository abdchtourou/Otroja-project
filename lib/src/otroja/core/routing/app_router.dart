import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/presentation/screens/add_staff.dart';
import 'package:admins/src/otroja/presentation/screens/absence/studentsAbsence/checkStudentsScreen.dart';
import 'package:admins/src/otroja/presentation/screens/student/edit_information_student.dart';
import 'package:admins/src/otroja/presentation/screens/student/student_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/course/course_cubit.dart';
import '../../cubit/groups/group_cubit.dart';
import '../../cubit/staff/staff_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/datasource/api_services.dart';
import '../../data/repository/course_repository.dart';
import '../../data/repository/group_repository.dart';
import '../../data/repository/staff_repository.dart';
import '../../presentation/screens/Groups/addGroup/add_group.dart';
import '../../presentation/screens/activity/showActivities/activityScreen.dart';
import '../../presentation/screens/student/show_students.dart';
import '../../presentation/screens/tasme3/tasmeaaScreen.dart';
import '../di/dependency_injection.dart';


class AppRouter {
  late final GroupRepository _groupRepository;
  late final GroupCubit _groupCubit;

  AppRouter() {
    _groupRepository = GroupRepository(ApiService());
    _groupCubit = GroupCubit(_groupRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child:  ActivityScreen(),
                )
            );
      case'showStudent':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<ShowStudentsCubit>(),
              child: ShowStudents(),)
        );
      case 'addGroup' :
       return MaterialPageRoute(
         builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (BuildContext context) =>
                        StaffCubit(StaffRepository(ApiService())),
                  ),
                  BlocProvider(
                    create: (context) => CourseCubit(CourseRepository(ApiService())),
                  ),
                  BlocProvider(
                    create: (context) => GroupCubit(GroupRepository(ApiService())),
                  ),
                ],
                child: AddGroup(),
              ),
       );


    }
    return null;
  }
}
