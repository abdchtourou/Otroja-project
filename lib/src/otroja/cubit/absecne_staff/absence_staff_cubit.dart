import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/absence_model/absence_staff_model.dart';
import '../../data/models/course_model.dart';
import '../../data/models/group_model.dart';
import '../../data/repository/absence/absence_staff_repo.dart';

part 'absence_staff_state.dart';

class AbsenceStaffCubit extends Cubit<AbsenceStaffState> {
  AbsenceStaffCubit(this.absenceStaffRepo) : super(AbsenceStaffInitial()) {
    getCourse();
  }

  AbsenceStaffRepo absenceStaffRepo;
  DateTime? dateTime = DateTime.now();
  int? idCourse;

  List<int> isPresentList = [];
  List<int> isAbsence = [];
  List<Group> listGroups = [];
  List<Course> listCourses = [];

  Future<void> getCourse() async {
    emit(AbsenceStaffLoadingCourses());
    try {
      listCourses = await absenceStaffRepo.getAllCourses();
      idCourse = listCourses[0].id;
      emit(AbsenceStaffCoursesLoaded(listCourses));
      getGroupByCourseLevel();
    } catch (e) {
      emit(AbsenceStaffError('Failed to load courses'));
    }
  }

  Future<void> getGroupByCourseLevel() async {
    emit(AbsenceStaffLoadingGroups());
    try {
      listGroups = await absenceStaffRepo.getGroupsByCourseLevel(idCourse!);
      isPresentList = List<int>.filled(listGroups.length, 0);
      emit(AbsenceStaffGroupsLoaded(listGroups));
    } catch (e) {
      emit(AbsenceStaffError('Failed to load groups'));
    }
  }

  void togglePresence(int index, bool isPresent) {
    isPresentList[index] = isPresent ? 1 : 2;
    emit(AbsenceStaffGroupsLoaded(listGroups));
  }

  void addAbsence(int id, bool isPresent) {
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

  Future<void> postAbsenceData() async {
    final data = AbsenceStaffModel(
      CourseId: idCourse!.toString(),
      StaffIds: isAbsence,
      date: dateTime.toString(),
    );
    try {
      await absenceStaffRepo.post(data.toJson());
      emit(AbsenceStaffSend());
    } catch (e) {
      emit(AbsenceStaffError('Failed to post absence data'));
    }
  }
}
