import 'package:admins/src/otroja/data/models/course_model.dart';
import 'package:admins/src/otroja/data/repository/course_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository repository;

  CourseCubit(this.repository) : super(CourseInitial()) {
    getAllCourses();
  }

  Future<void> getAllCourses() async {
    try {
      emit(CourseLoading());
      final courses = await repository.getAllCourses();
      emit(CoursesLoaded(courses));
     
    } catch (e) {
      print(e);
      emit(CourseError(e.toString()));
    }
  }
}
