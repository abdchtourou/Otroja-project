part of 'course_cubit.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}
class CourseLoading extends CourseState {}
class CourseCreated extends CourseState{}

class CoursesLoaded extends CourseState {
  final List<Course> courses;
  CoursesLoaded(this.courses);
}

class CourseError extends CourseState {
  final String message;
  CourseError(this.message);
}