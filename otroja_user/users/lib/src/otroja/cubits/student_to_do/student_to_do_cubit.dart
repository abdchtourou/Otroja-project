import 'package:bloc/bloc.dart';

import '../../data/repositories/student_to_do_repository.dart';
import 'student_to_do_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentToDoRepository _studentRepository;

  StudentCubit(this._studentRepository) : super(StudentInitial());

  Future<void> loadStudents() async {
    emit(StudentLoading());
    try {
      final students = await _studentRepository.fetchStudents();
     // print(students);
      emit(StudentLoaded(students));
    } catch (e) {
     // print(e);
      emit(StudentError(e.toString()));
    }
  }
}
