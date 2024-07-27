import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/show_students_repo.dart';
import 'package:admins/src/otroja/presentation/screens/activity/addActivity/addActivityScreen.dart';
import 'package:admins/src/otroja/presentation/screens/student/edit_information_student.dart';
import 'package:admins/src/otroja/presentation/screens/student/student_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/activityCubit/add_activity/add_activity_cubit.dart';
import '../../cubit/course/course_cubit.dart';
import '../../cubit/groups/group_cubit.dart';
import '../../cubit/staff/staff_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/datasource/api_services.dart';
import '../../data/repository/course_repository.dart';
import '../../data/repository/group_repository.dart';
import '../../data/repository/staff_repository.dart';
import '../../presentation/screens/Groups/ShowGroups/GroupsScreen.dart';
import '../../presentation/screens/Groups/addGroup/add_group.dart';
import '../../presentation/screens/Groups/addStudentToGroup/add_student_to_group_screen.dart';
import '../../presentation/screens/Groups/groupStudents/group_students_screen.dart';
import '../../presentation/screens/absence/studentsAbsence/checkStudentsScreen.dart';
import '../../presentation/screens/absence/teachersAbsence/checkGroupsScreen.dart';
import '../../presentation/screens/parents/addParents/add_parents.dart';
import '../../presentation/screens/permissions/ShowAuthorizedAdmins/show_authorized_admins.dart';
import '../../presentation/screens/permissions/ShowPermissions/show_permissions_screen.dart';
import '../../presentation/screens/student/show_students.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  ShowStudentsCubit showStudentsCubit = ShowStudentsCubit(ShowStudentsRepo(ApiService()));
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) =>
                    StaffCubit(StaffRepository(ApiService())),
              ),
              BlocProvider(
                create: (context) =>
                    CourseCubit(CourseRepository(ApiService())),
              ),
              BlocProvider(
                create: (context) => GroupCubit(GroupRepository(ApiService())),
              ),
               BlocProvider.value(
                value: showStudentsCubit,
              ),
            ],
            child: AddGroup(),
          ),
        );

      case Routes.addParents:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child: AddParents(),
                ));

      case Routes.showStudents:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child: ShowStudents(),
                )
                );

      case Routes.checkStudents:
        return MaterialPageRoute(builder: (_) => CheckStudentScreen());

      case Routes.checkGroups:
        return MaterialPageRoute(builder: (_) => CheckGroupsScreen());

      case Routes.addGroup:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) =>
                    StaffCubit(StaffRepository(ApiService())),
              ),
              BlocProvider(
                create: (context) =>
                    CourseCubit(CourseRepository(ApiService())),
              ),
              BlocProvider(
                create: (context) => GroupCubit(GroupRepository(ApiService())),
              ),
            ],
            child: AddGroup(),
          ),
        );

      case Routes.addStudentToGroup:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: showStudentsCubit,
                child: AddStudentToGroupScreen()));

      case Routes.groupStudents:
        return MaterialPageRoute(
            builder: (_) => GroupStudentsScreen(
                  groupId: 1,
                ));

      case Routes.groups:
        return MaterialPageRoute(builder: (_) => GroupsScreen());

      case Routes.addActivity:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<AddActivityCubit>(),
                child: AddActivityScreen()));

      case Routes.studentDetails:
        final ShowStudentModel? showStudentModel =
            settings.arguments as ShowStudentModel?;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child: StudentDetails(
                    showStudentModel: showStudentModel!,
                  ),
                ));
      case Routes.editStudentInfo:
        final studentId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<EditInfoStudentCubit>(),
                  child: EditInformationStudent(
                    studentId: studentId,
                  ),
                ));

      case Routes.showAuthorizedAdmins:
        return MaterialPageRoute(builder: (_) => ShowAuthorizedAdminsScreen());

      case Routes.showPermissions:
        return MaterialPageRoute(builder: (_) => ShowPermissionsScreen());
    }
    return null;
  }
}
