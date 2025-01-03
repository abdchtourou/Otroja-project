import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_bank/question_bank_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_cubit.dart';
import 'package:admins/src/otroja/cubit/absecne_staff/absence_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/activityCubit/show_activity/show_activity_cubit.dart';
import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/cubit/permissionCubit/permission_cubit.dart';
import 'package:admins/src/otroja/cubit/recite/recite_cubit.dart';
import 'package:admins/src/otroja/cubit/students/check_student/check_student_cubit.dart';
import 'package:admins/src/otroja/cubit/subjectCubit/subject_cubit.dart';
import 'package:admins/src/otroja/data/models/course_model.dart';
import 'package:admins/src/otroja/data/models/permission_model.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/data/repository/level_repository.dart';
import 'package:admins/src/otroja/data/repository/parent_repository.dart';
import 'package:admins/src/otroja/data/repository/permission_repository.dart';
import 'package:admins/src/otroja/data/repository/recite_repository.dart';
import 'package:admins/src/otroja/data/repository/standard_repository.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/show_students_repo.dart';
import 'package:admins/src/otroja/data/repository/subject_repository.dart';
import 'package:admins/src/otroja/presentation/screens/Courses/AddCourses/addCoursesScreen.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/question_bank.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/qustion.dart';
import 'package:admins/src/otroja/presentation/screens/Home/homePage.dart';
import 'package:admins/src/otroja/presentation/screens/activity/addActivity/addActivityScreen.dart';
import 'package:admins/src/otroja/presentation/screens/activity/showActivities/activityScreen.dart';
import 'package:admins/src/otroja/presentation/screens/student/edit_information_student.dart';
import 'package:admins/src/otroja/presentation/screens/student/student_details.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/show_subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/activityCubit/add_activity/add_activity_cubit.dart';
import '../../cubit/course/course_cubit.dart';
import '../../cubit/groups/group_cubit.dart';
import '../../cubit/levelCubit/level_cubit.dart';
import '../../cubit/staff/staff_cubit.dart';
import '../../cubit/standardCubit/standard_cubit.dart';
import '../../cubit/students/add_studnet/cubit/add_student_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/datasource/api_services.dart';
import '../../data/repository/course_repository.dart';
import '../../data/repository/group_repository.dart';
import '../../data/repository/staff_repository.dart';
import '../../presentation/screens/Exams/create_exam.dart';
import '../../presentation/screens/management/management_screen.dart';
import '../../presentation/screens/Courses/ShowCourses/show_courses.dart';
import '../../presentation/screens/Groups/ShowGroups/GroupsScreen.dart';
import '../../presentation/screens/Groups/addGroup/add_group.dart';
import '../../presentation/screens/Groups/addStudentToGroup/add_student_to_group_screen.dart';
import '../../presentation/screens/Groups/groupStudents/group_students_screen.dart';
import '../../presentation/screens/Levels/levels.dart';
import '../../presentation/screens/absence/studentsAbsence/checkStudentsScreen.dart';
import '../../presentation/screens/absence/teachersAbsence/checkGroupsScreen.dart';
import '../../presentation/screens/parents/addParents/add_parents.dart';
import '../../presentation/screens/permissions/ShowAuthorizedAdmins/show_authorized_admins.dart';
import '../../presentation/screens/permissions/ShowPermissions/show_permissions_screen.dart';
import '../../presentation/screens/staff/add_staff.dart';
import '../../presentation/screens/student/add_student.dart';
import '../../presentation/screens/student/show_students.dart';
import '../../presentation/screens/subjectOrGroups/subject_or_group_screen.dart';
import '../../presentation/screens/tasme3/tasmeaaScreen.dart';
import '../../presentation/screens/tasme3/widgets/show_students_recit.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  ShowStudentsCubit showStudentsCubit =
      ShowStudentsCubit(ShowStudentsRepo(ApiService()));
  StandardCubit standardCubit = StandardCubit(StandardRepository(ApiService()));
  GroupCubit groupCubit = GroupCubit(GroupRepository(ApiService()));
  SubjectCubit subjectCubit = SubjectCubit(SubjectRepository(ApiService()));
  LevelCubit levelCubit = LevelCubit(LevelRepository(ApiService()));
  PermissionCubit permissionCubit =
      PermissionCubit(PermissionRepository(ApiService()));

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.addCourses:
        levelCubit.getAllLevels();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          CourseCubit(CourseRepository(ApiService())),
                    ),
                    BlocProvider.value(
                      value: levelCubit,
                    ),
                  ],
                  child: AddCourses(),
                ));

      case Routes.showStudentsRecite:
        showStudentsCubit.getStudents();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: showStudentsCubit,
                    ),
                    BlocProvider.value(
                      value: standardCubit,
                    ),
                  ],
                  child: ShowStudentsRecite(),
                ));

      case Routes.tasmeaa:
        standardCubit.getStandards();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          ReciteCubit(ReciteRepository(ApiService())),
                    ),
                    BlocProvider.value(
                      value: standardCubit,
                    ),
                  ],
                  child: TasmeaaScreen(),
                ));

      case Routes.showLevels:
        final List<Level> levels = settings.arguments as List<Level>;

        return MaterialPageRoute(
            builder: (_) => ShowLevels(
                  levels: levels,
                ));

      case Routes.subjectOrGroup:
        final int courseLevelId = settings.arguments as int;
        groupCubit.getGroupByCourseLevel(courseLevelId);
        subjectCubit.getSubjectsByCourseLeve(courseLevelId);
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: groupCubit,
                    ),
                    BlocProvider.value(
                      value: subjectCubit,
                    ),
                  ],
                  child: SubjectOrGroupScreen(
                    courseLevelId: courseLevelId,
                  ),
                ));

      case Routes.showCourses:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      CourseCubit(CourseRepository(ApiService())),
                  child: ShowCourses(),
                ));

      case Routes.addParents:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      ParentCubit(ParentRepository(ApiService())),
                  child: const AddParents(),
                ));

      case Routes.showStudents:
        showStudentsCubit.getStudents();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child: ShowStudents(),
                ));

      case Routes.checkStudents:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<CheckStudentCubit>(),
                  child: CheckStudentScreen(),
                ));

      case Routes.checkGroups:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AbsenceStaffCubit>(),
                  child: CheckGroupsScreen(),
                ));

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
        showStudentsCubit.getStudents();
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: showStudentsCubit,
                child: const AddStudentToGroupScreen()));

      case Routes.groupStudents:
        final groupId = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      getIt<ShowStudentsCubit>()..getStudentsByGroupId(groupId),
                  child: GroupStudentsScreen(
                    groupId: groupId,
                  ),
                ));

      case Routes.groups:
        final isSelectedGroup = settings.arguments as bool;

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          CourseCubit(CourseRepository(ApiService())),
                    ),
                    BlocProvider.value(
                      // create: (context)=>GroupCubit(GroupRepository(ApiService())),
                      value: groupCubit,
                    ),
                    BlocProvider.value(
                      // create: (context)=>GroupCubit(GroupRepository(ApiService())),
                      value: levelCubit,
                    ),
                    BlocProvider.value(
                      // create: (context)=>GroupCubit(GroupRepository(ApiService())),
                      value: getIt<CreateExamCubit>(),
                    ),
                  ],
                  child: GroupsScreen(
                    isSelectedGroup: isSelectedGroup,
                  ),
                ));

      case Routes.addActivity:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<AddActivityCubit>(),
                child: const AddActivityScreen()));

      case Routes.activity:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<ShowActivityCubit>(),
                child: ActivityScreen()));

      case Routes.studentDetails:
        final ShowStudentModel? showStudentModel =
            settings.arguments as ShowStudentModel?;
        return MaterialPageRoute(
            builder: (_) => StudentDetails(
                  showStudentModel: showStudentModel!,
                ));
      case Routes.editStudentInfo:
        final studentId = settings.arguments as String;
        // return MaterialPageRoute(
        //     builder: (_) => BlocProvider(
        //           create: (context) => getIt<EditInfoStudentCubit>(),
        //           child: EditInformationStudent(
        //             studentId: studentId,
        //           ),
        //         ));

      case Routes.showAuthorizedAdmins:
        final permission = settings.arguments as Permission;
        return MaterialPageRoute(
            builder: (_) => ShowAuthorizedAdminsScreen(
                  permission: permission,
                ));

      case Routes.showPermissions:
        permissionCubit.getPermissions();
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: permissionCubit,
                  child: ShowPermissionsScreen(),
                ));

      case Routes.addStudent:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AddStudentCubit>(),
                  child: const AddStudent(),
                ));
      case Routes.question:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<QuestionCubit>(),
                  child: const Question(),
                ));
      case Routes.addStaff:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AddStaffCubit>(),
                  child: const AddStaff(),
                ));
      case Routes.showSubject:
        return MaterialPageRoute(builder: (_) => ShowSubject());

      case Routes.managemet:
        return MaterialPageRoute(builder: (_) => ManagemetScreen());
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CreateExamCubit>(),
              ),
              BlocProvider(
                  create: (context) => CourseCubit(
                        CourseRepository(ApiService()),
                      )),
              BlocProvider(
                  create: (context) => levelCubit),
              BlocProvider(
                  create: (context) => getIt<QuestionCubit>()),
            ],
            child: CreateExam(),
          ),
        );
      case Routes.questionBank:
        final bool isAdd = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<CreateExamCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<QuestionBankCubit>(),
                    ),
                  ],
                  child: QuestionBank(
                    isAdd: isAdd,
                  ),
                ));
    }

    return null;
  }
}
