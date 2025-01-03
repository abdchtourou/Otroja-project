import '../datasource/api_services.dart';
import '../models/subject_model.dart';

class SubjectRepository {
  final ApiService _apiService;

  SubjectRepository(this._apiService);

  Future<List<Subject>> getSubjectsByCourseLevel(int courseLevelId) async {
    try {
      final response =
          await _apiService.get('subjects/course_level/$courseLevelId');
      if (response.statusCode == 200) {
        final List<dynamic> subjectsJson = response.data['data'];
        return subjectsJson.map((json) => Subject.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load subjects for course level $courseLevelId');
      }
    } catch (e) {
      throw Exception(
          'Error fetching subjects for course level $courseLevelId: $e');
    }
  }
}
