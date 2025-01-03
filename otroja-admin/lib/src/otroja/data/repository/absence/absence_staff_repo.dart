import 'package:admins/src/otroja/data/datasource/api_services.dart';

import '../../models/course_model.dart';
import '../../models/group_model.dart';

class AbsenceStaffRepo{
  ApiService apiService ;
  AbsenceStaffRepo(this.apiService);
  Future<List<Course>>  getAllCourses() async {
    try {
      final response = await apiService.get('courses');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        List<dynamic> coursesJson = responseData['data'];
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
  Future<List<Group>> getGroupsByCourseLevel(int courseLevelId) async {
    final response =
    await apiService.get('groups',queryParameters:  {'course_level_id': courseLevelId.toString()});
    final List<dynamic> data = response.data['data'];
    return data.map((json) => Group.fromJson(json)).toList();
  }

  post(dynamic body) async{
    final response = await apiService.post("absence/teacher",data: body);
    return response;

  }


}