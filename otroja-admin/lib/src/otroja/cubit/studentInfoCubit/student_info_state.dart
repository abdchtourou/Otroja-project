part of 'student_info_cubit.dart';

@immutable
abstract class StudentInfoState {}

class StudentInfoInitial extends StudentInfoState {}

class StudentInfoLoading extends StudentInfoState {}

class StudentInfoLoaded extends StudentInfoState {
  final StudentInfo studentInfo;

  StudentInfoLoaded(this.studentInfo);
}

class StudentInfoError extends StudentInfoState {
  final String message;

  StudentInfoError(this.message);
}
