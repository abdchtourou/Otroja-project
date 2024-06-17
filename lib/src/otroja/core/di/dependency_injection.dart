import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/repository/students_rpeos/show_students_repo.dart';
import '../networking/api_services.dart';

final getIt=GetIt.instance;
Future<void> setUpGetIt()async{
  ApiServices apiServices = ApiServices();
  getIt.registerLazySingleton<ShowStudentsRepo>(() => ShowStudentsRepo(apiServices));
  getIt.registerLazySingleton<ShowStudentsCubit>(() => ShowStudentsCubit( getIt()));



}