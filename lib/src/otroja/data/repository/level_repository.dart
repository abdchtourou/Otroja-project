// level_repository.dart
import 'package:dio/dio.dart';
import '../datasource/api_services.dart';
import '../models/course_model.dart';


class LevelRepository {
  final ApiService _apiService;

  LevelRepository(this._apiService);

  Future<List<Level>> getLevelsByCourseId(int courseId) async {
    try {
      final response = await _apiService.get('/levels/course/$courseId');
      if (response.statusCode == 200) {
        final List<dynamic> levelsJson = response.data['data'];
        return levelsJson.map((json) => Level.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load levels');
      }
    } catch (e) {
      throw Exception('Failed to load levels: $e');
    }
  }
}
