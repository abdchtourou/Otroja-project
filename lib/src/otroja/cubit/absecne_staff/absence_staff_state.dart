part of 'absence_staff_cubit.dart';

@immutable
abstract class AbsenceStaffState {}

class AbsenceStaffInitial extends AbsenceStaffState {}
class AbsenceStaffLoadingCourses extends AbsenceStaffState {}
class AbsenceStaffCoursesLoaded extends AbsenceStaffState {
  List<Course> listCourses = [];

  AbsenceStaffCoursesLoaded(this.listCourses);
}
class AbsenceStaffLoadingGroups extends AbsenceStaffState {}
class AbsenceStaffGroupsLoaded extends AbsenceStaffState {
  List<Group> listGroups = [];

  AbsenceStaffGroupsLoaded(this.listGroups);
}
class AbsenceStaffSend extends AbsenceStaffState {}
class AbsenceStaffError extends AbsenceStaffState {
  final String message;
  AbsenceStaffError(this.message);
}
