part of 'subject_cubit.dart';

@immutable
sealed class SubjectState {}

final class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectsLoaded extends SubjectState {
  final List<Subject> subjects;

  SubjectsLoaded(this.subjects);
}

class SubjectError extends SubjectState {
  final String message;

  SubjectError(this.message);
}
