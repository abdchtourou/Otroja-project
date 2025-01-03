import '../datasource/api_services.dart';
import '../models/stuednt_info.dart';

class StudentRepository {
  final ApiService _apiService;

  StudentRepository(this._apiService);

  Future<StudentInfo> getStudentInfo(int studentId) async {
    try {
      final response =
          await _apiService.get('/student/stats', queryParameters: {
        'student_id': studentId,
      });
      
      if (response.statusCode == 200) {
        print(response.data['data']);
        return StudentInfo.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load student info');
      }
    } catch (e) {
      throw Exception('Failed to load student info: $e');
    }
  }
}
