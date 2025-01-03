import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/student_to_do.dart';

// Define the states
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final List<Student> students;

  StudentLoaded(this.students);
}

class StudentError extends StudentState {
  final String message;

  StudentError(this.message);
}