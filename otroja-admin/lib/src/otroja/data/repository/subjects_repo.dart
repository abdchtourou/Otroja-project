import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/subjects_model.dart';

class SubjectsRepo{
  ApiService apiService;

  SubjectsRepo(this.apiService);
  Future<List<SubjectsModel>> getSubjects() async {
    try {
      final response =
      await apiService.get('subjects/all');
      if (response.statusCode == 200) {
        final List<dynamic> subjectsJson = response.data['data'];

        return subjectsJson.map((json) => SubjectsModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load subjects ');
      }
    } catch (e) {
      throw Exception(
          'Error fetching subjects for course level  $e');
    }
  }
}