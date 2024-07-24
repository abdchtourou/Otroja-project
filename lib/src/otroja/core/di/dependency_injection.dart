import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/add_studnet/add_studnet_cubit.dart';
import 'package:admins/src/otroja/cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';
import 'package:admins/src/otroja/data/repository/activity_repos/add_activity_repo.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/edit_info_student_repo.dart';
import 'package:admins/src/otroja/presentation/screens/activity/addActivity/addActivityScreen.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/activityCubit/add_activity/add_activity_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/datasource/api_services.dart';
import '../../data/repository/students_rpeos/show_students_repo.dart';

final getIt=GetIt.instance;
Future<void> setUpGetIt()async{
  ApiService apiServices = ApiService();
  getIt.registerLazySingleton<ShowStudentsRepo>(() => ShowStudentsRepo(apiServices));
  getIt.registerLazySingleton<ShowStudentsCubit>(() => ShowStudentsCubit( getIt()));
  getIt.registerLazySingleton<AddStudentCubit>(()=>AddStudentCubit());
  getIt.registerLazySingleton<EditInfoStudentRepo>(() => EditInfoStudentRepo(apiServices));
  getIt.registerLazySingleton<EditInfoStudentCubit>(()=>EditInfoStudentCubit(getIt()));
  getIt.registerLazySingleton<AddStaffCubit>(()=>AddStaffCubit());
  // Add Activity
  getIt.registerLazySingleton<AddActivityRepo>(()=>AddActivityRepo(apiServices));
  getIt.registerLazySingleton<AddActivityCubit>(()=>AddActivityCubit(getIt()));

}