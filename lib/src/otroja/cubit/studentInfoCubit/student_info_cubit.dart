// lib/cubit/student_info_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/stuednt_info.dart';
import '../../data/repository/student_info_repository.dart';


part 'student_info_state.dart';

class StudentInfoCubit extends Cubit<StudentInfoState> {
  final StudentRepository _repository;

  StudentInfoCubit(this._repository) : super(StudentInfoInitial());

  Future<void> fetchStudentInfo(int studentId) async {
    try {
      emit(StudentInfoLoading());
      final studentInfo = await _repository.getStudentInfo(studentId);
      emit(StudentInfoLoaded(studentInfo));
    } catch (e) {
      emit(StudentInfoError(e.toString()));
    }
  }
}
