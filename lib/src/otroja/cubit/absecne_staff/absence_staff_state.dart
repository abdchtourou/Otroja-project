part of 'absence_staff_cubit.dart';

@immutable
sealed class AbsenceStaffState {}

final class AbsenceStaffInitial extends AbsenceStaffState {}
final class AbsenceStaffTest extends AbsenceStaffState {}
final class AbsenceStaffSend extends AbsenceStaffState {}
