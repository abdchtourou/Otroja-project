import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/course_model.dart';
import 'package:admins/src/otroja/data/models/group_model.dart';
import 'package:admins/src/otroja/data/repository/absence/absence_staff_repo.dart';
import 'package:admins/src/otroja/data/repository/group_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/absence_model/absence_staff_model.dart';

part 'absence_staff_state.dart';

class AbsenceStaffCubit extends Cubit<AbsenceStaffState> {
  AbsenceStaffCubit(this.absenceStaffRepo) : super(AbsenceStaffInitial()) {
    getCourse();
    print('//////////////////// in cont');
  }

  AbsenceStaffRepo absenceStaffRepo;
  DateTime? dateTime=DateTime.now();
  int? idCourse;

  List<int> isPresentList = [];
  List<int> isAbsence = [];
  List<Group> listGroups = [];
  List<Course> listCourses = [];

  Future<void> getCourse() async {
    print('//////////////////////////// in course');
    listCourses.addAll(await absenceStaffRepo.getAllCourses());
    print(listCourses);
    idCourse = listCourses[0].id;
    emit(AbsenceStaffTest());
    getGroupByCourseLevel();
  }

  Future<void> getGroupByCourseLevel() async {
    print('////////////////////////// b g');
    listGroups.clear();
    listGroups.addAll(await absenceStaffRepo.getGroupsByCourseLevel(idCourse!));
    print(listGroups);
    print('/////////////////////////a g'
        '');
    isPresentList = List<int>.filled(listGroups.length, 0);
    emit(AbsenceStaffTest());
  }

  void togglePresence(int index, bool isPresent) {
    isPresentList[index] = isPresent ? 1 : 2;

    emit(AbsenceStaffTest());
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
    print(isAbsence);
  }
  post() async {
    final data =
    AbsenceStaffModel(CourseId:idCourse!.toString() , StaffIds: isAbsence, date: dateTime.toString());
    print(data.toJson());
    print('/////////////////////////////////// post zed');
    await absenceStaffRepo.post(data.toJson());
    emit(AbsenceStaffSend());
  }
}
