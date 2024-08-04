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
  List<String> coursesNames = [];
  Map<String, int> coursesId = {};


  Future<void> createCourse(
      String startDate, String name, List<int> levelIds) async {
    try {
      emit(CourseLoading());
      await repository.createCourse(startDate, name, levelIds);
      emit(CourseCreated());
    } catch (e) {
      print(e);
      emit(CourseError(e.toString()));
    }
  }

  var courseId;
  Future<void> getAllCourses() async {

    try {
      emit(CourseLoading());
      final courses = await repository.getAllCourses();
      for (var element in courses) {
        coursesNames.add(element.name);
        coursesId[element.name!] = element.id!;
      }

      print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
      print(courses);
      emit(CoursesLoaded(courses));
    } catch (e) {
      print('eeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(e);
      emit(CourseError(e.toString()));
    }
  }
}
