

import 'package:admins/src/otroja/data/datasource/api_services.dart';

import 'package:admins/src/otroja/data/models/course_model.dart';

class CourseRepository {
  final ApiService _apiService;

  CourseRepository(this._apiService);
  Future<int> createCourse(String startDate,String name, List<int> levelIds) async {
    try {
      final response = await _apiService.post('course/create', data: {
        'name': name,
        'level_ids': levelIds,
        'start_date':startDate,
      });

      if (response.statusCode == 201) {
       
        return response.data['status'];
      } else {
        throw Exception('Failed to create course');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to create course: $e');
    }
  }

  // Future<List<Course>> getAllCourses() async {
  //   try {
  //     final response = await _apiService.get('courses');
  //     if (response.statusCode == 200) {
  //       List<dynamic> coursesJson = response.data;
  //       return coursesJson.map((json) => Course.fromJson(json)).toList();
  //     } else {
  //       throw Exception('Failed to load courses');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load courses: $e');
  //   }
  // }

  // Future<Course> getCourseById(int id) async {
  //   try {
  //     final response = await _apiService.get('courses/$id');
  //     if (response.statusCode == 200) {
  //       return Course.fromJson(response.data);
  //     } else {
  //       throw Exception('Failed to load course');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load course: $e');
  //   }
  // }

  Future<List<Course>> getAllCourses() async {
    try {
      final response = await _apiService.get('courses');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
          print("hhhhhhhhhhhhhhhh");
        print(response.data['data']);
        List<dynamic> coursesJson = responseData['data'];
          print("kkkkkkkkkkkkkkkkkkkkkkkk");
        print(coursesJson);
        return coursesJson.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load courses: ${e}');
    }
  }
}
