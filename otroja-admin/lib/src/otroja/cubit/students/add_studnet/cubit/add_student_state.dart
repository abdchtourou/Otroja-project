part of 'add_student_cubit.dart';

@immutable
sealed class AddStudentState {}

final class AddStudentInitial extends AddStudentState {}
class StudentLoading extends AddStudentState {}
class StudentRegistered extends AddStudentState {}
class StudentError extends AddStudentState {
  final String message;
  StudentError(this.message);
}