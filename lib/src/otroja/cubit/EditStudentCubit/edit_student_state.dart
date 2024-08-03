part of 'edit_student_cubit.dart';

sealed class EditStudentState extends Equatable {
  const EditStudentState();

  @override
  List<Object> get props => [];
}

final class EditStudentInitial extends EditStudentState {}
class StudentUpdateInitial extends EditStudentState {}

class StudentUpdateLoading extends EditStudentState {}

class StudentUpdateSuccess extends EditStudentState {}

class StudentUpdateError extends EditStudentState {
  final String message;

  StudentUpdateError(this.message);
}