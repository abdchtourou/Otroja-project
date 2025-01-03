import 'dart:ffi';
import 'dart:math';

import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/show_students_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  final ShowStudentsRepo _repository;

  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  String? address;
  String? birthDate;
  String? grade;
  int? groupId;


  AddStudentCubit(this._repository) : super(AddStudentInitial());

  Future<void> registerStudent({
    required String userName,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required int parentId,
    required String phoneNumber,
    required String address,
    required String birthDate,
    required String grade,
    required int groupId,
  }) async {
    emit(StudentLoading());
    try {
      final student = ShowStudentModel(
        userName: userName,
        password: password,
        firstName: firstName,
        lastName: lastName,
        email: email,
        parentId: parentId,
        phoneNumber: phoneNumber,
        address: address,
        birthDate: birthDate,
        grade: grade,
        groupId: groupId
      );

      await _repository.registerStudent(student);
      emit(StudentRegistered());
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }

    reset(){
    firstName = null;
   lastName = null;
   userName = null;
   email = null;
   password = null;
   confirmPassword = null;
   phone = null;
   address = null;
   birthDate = null;
   grade = null;
  }
}
