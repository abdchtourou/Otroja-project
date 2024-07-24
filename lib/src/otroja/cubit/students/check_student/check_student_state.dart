import 'package:meta/meta.dart';

@immutable
abstract class CheckStudentState {}

class CheckStudentInitial extends CheckStudentState {}

class CheckStudentLoading extends CheckStudentState {}

class CheckStudentLoaded extends CheckStudentState {
  final List<int> isPresentList;

  CheckStudentLoaded(this.isPresentList);
}

class CheckStudentError extends CheckStudentState {
  final String error;

  CheckStudentError(this.error);
}
