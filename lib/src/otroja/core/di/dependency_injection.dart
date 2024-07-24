import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/add_studnet/add_studnet_cubit.dart';
import 'package:admins/src/otroja/cubit/students/edit_info_student_cubit/edit_info_student_cubit.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/edit_info_student_repo.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/repository/students_rpeos/show_students_repo.dart';
import '../networking/api_services.dart';

final getIt=GetIt.instance;
Future<void> setUpGetIt()async{
  ApiService apiServices = ApiService();
  getIt.registerFactory<ShowStudentsRepo>(() => ShowStudentsRepo(apiServices));
  getIt.registerFactory<ShowStudentsCubit>(() => ShowStudentsCubit(getIt()));
  getIt.registerFactory<AddStudentCubit>(()=>AddStudentCubit());

  getIt.registerFactory<EditInfoStudentRepo>(() => EditInfoStudentRepo(apiServices));
  getIt.registerFactory<EditInfoStudentCubit>(()=>EditInfoStudentCubit(getIt()));

  getIt.registerFactory<AddStaffCubit>(()=>AddStaffCubit());


}