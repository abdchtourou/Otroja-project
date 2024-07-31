import 'dart:math';

import 'package:admins/src/otroja/data/models/absence_model/absence_model.dart';
import 'package:admins/src/otroja/data/repository/absence/absence_repo.dart';
import 'package:bloc/bloc.dart';

import '../../../data/models/absence_model/get_groups.dart';
import '../../../data/models/student_model/show_students.dart';
import 'check_student_state.dart';

class CheckStudentCubit extends Cubit<CheckStudentState> {
  List<int> isPresentList = [];

  CheckStudentCubit(this.absenceRepo) : super(CheckStudentInitial()) {
    getGroups();
  }
  DateTime? dateTime=DateTime.now();

  AbsenceRepo absenceRepo;

  List<int> isAbsence = [];
  List<getGroupsModel> groupsName = <getGroupsModel>[];
  List<ShowStudentModel> studentsList = <ShowStudentModel>[];
  int? idGroup;

  Future<void> getGroups() async {
    await absenceRepo.getGroups();
    idGroup = absenceRepo.groupsName[0].id!;
    groupsName.addAll(absenceRepo.groupsName);
    getStudents();
  }

  Future<void> getStudents() async {
    emit(CheckStudentLoading());

    try {
      await absenceRepo.getStudent(idGroup!);
      studentsList.clear();

      studentsList.addAll(absenceRepo.studentsList);
      absenceRepo.groupsName.clear();
      absenceRepo.studentsList.clear();

      isPresentList = List<int>.filled(studentsList.length, 0);
      emit(CheckStudentLoaded(isPresentList, studentsList));
    } catch (error) {
      emit(CheckStudentError(error.toString()));
    }
  }

  void togglePresence(int index, bool isPresent) {
    isPresentList[index] = isPresent ? 1 : 2;

    emit(CheckStudentLoaded(isPresentList, studentsList));
  }

  addAbsence(int id, bool isPresent) {
    if (isPresent) {
      if (!isAbsence.remove(id)) {
        isAbsence.add(id);
      }
    } else {
      if (!isAbsence.contains(id)) {
        isAbsence.add(id);
      }
    }
  }

  post() async {
    final data =
        AbsenceModel(groupId: '2', studentIds: isAbsence, date: dateTime.toString());
    print(data.toJson());
    await absenceRepo.post(data.toJson());
    emit(CheckStudentSend());
  }
}
