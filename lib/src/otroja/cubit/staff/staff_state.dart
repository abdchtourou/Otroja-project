part of 'staff_cubit.dart';

@immutable
sealed class StaffState {}

final class StaffInitial extends StaffState {}
final class StaffLoading extends StaffState {}
final class StaffRegistered extends StaffState {}
final class StaffLoaded extends StaffState {
  final List<Staff> staffList;
  
  StaffLoaded(this.staffList);
}
final class StaffError extends StaffState {
  final String message;
  StaffError(this.message);
}
final class UpdateSelectedStaffState extends StaffState {
  final List<int> selectedStaffs;

  UpdateSelectedStaffState(this.selectedStaffs);
}