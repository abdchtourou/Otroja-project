import '../datasource/api_services.dart';
import '../models/subject_model.dart';

class SubjectRepository {
  final ApiService _apiService;

  SubjectRepository(this._apiService);
  List<Subject> list=[];

  Future<List<Subject>> getSubjectsByCourseLevel(int courseLevelId) async {
    try {
      final response = await _apiService.get('subjects/course_level/$courseLevelId');
      print(response);
      print('///////////////////////////////// zed'
          '');
      if (response.statusCode == 200) {
        final  subjectsJson = response.data['data'];
        print(subjectsJson);

        for(var data in subjectsJson){
          list.add(Subject.fromJson(data));

        }
        print(list);
        return list;
        // return subjectsJson.map((json) => Subject.fromJson(json)).toList();
      } else {

        throw Exception('Failed to load subjects for course level $courseLevelId');
      }
    } catch (e) {
      throw Exception('Error fetching subjects for course level $courseLevelId: $e');
    }
  }

}
