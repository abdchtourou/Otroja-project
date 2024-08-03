import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/edit_info_student_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_student_state.dart';

class EditStudentCubit extends Cubit<EditStudentState> {
  final EditInfoStudentRepo _repository;

  EditStudentCubit(this._repository) : super(StudentUpdateInitial());

  int? studentId;
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? birthDate;
  String? grade;
  Future<void> updateStudent(ShowStudentModel student) async {
    emit(StudentUpdateLoading());
    try {
      await _repository.updateStudent(student);
      emit(StudentUpdateSuccess());
    } catch (e) {
      emit(StudentUpdateError(e.toString()));
    }
  }
}
