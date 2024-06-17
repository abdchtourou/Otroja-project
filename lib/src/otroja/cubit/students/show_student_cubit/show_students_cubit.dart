import 'package:admins/src/otroja/cubit/students/show_student_cubit/show_students_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/student_model/show_students.dart';
import '../../../data/repository/students_rpeos/show_students_repo.dart';

class ShowStudentsCubit extends Cubit<ShowStudentsState> {
  final ShowStudentsRepo showStudentsRepo;

  ShowStudentsCubit(this.showStudentsRepo) : super(ShowStudentsInitial()) {
    getStudents();
  }

  List<ShowStudentsModel> studentList = <ShowStudentsModel>[];

  getStudents() async {
    emit(ShowStudentsLoading());
    final students = await showStudentsRepo.getStudents();
    studentList.clear();
    for (var data in students['results']) {
      studentList.add(ShowStudentsModel.fromJson(data));
    }

    emit(ShowStudentsLoaded(studentList));
  }
}
