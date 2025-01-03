import '../datasource/api_services.dart';
import '../models/student_to_do.dart';

class StudentToDoRepository {
  final ApiService _apiService;

  StudentToDoRepository(this._apiService);

  Future<List<Student>> fetchStudents() async {
    try {
      final response = await _apiService
          .get('activities/students'); // Adjust the path as needed
          print(response);
      List<Student> students = (response.data['data'] as List)
          .map((studentJson) => Student.fromJson(studentJson))
          .toList();
      
      return students;
    } catch (e) {
      print(e);
      throw Exception('Failed to load students: $e');
    }
  }
}
