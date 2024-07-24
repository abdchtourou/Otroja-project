


import 'package:admins/src/otroja/data/models/student_model/show_students.dart';

import '../../datasource/api_services.dart';

class ShowStudentsRepo{
final  ApiService showStudentServices;

ShowStudentsRepo(this.showStudentServices);

    getStudents(page ) async{

      final students= await showStudentServices.get("students?page=$page");

      return students;


   }

 Future<List<ShowStudentModel>> getStudentsIslam() async {
    try {
      final response = await showStudentServices.get('students');
      
      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> responseData = response.data;
        
        if (responseData['status'] == 200 && 
            responseData['data'] is Map<String, dynamic> &&
            responseData['data']['data'] is List) {
          final List<dynamic> studentsData = responseData['data']['data'];
          return studentsData.map((json) => ShowStudentModel.fromJson(json)).toList();
        } else {
          throw Exception('Unexpected data structure in the response');
        }
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      print('Error fetching students: $e');
      rethrow;
    }
  }

  Future<List<ShowStudentModel>> getStudentsByGroupId(int groupId) async {
    try {
      final response = await showStudentServices.get('group/students', queryParameters: {'group_id': groupId.toString()});
      
      if (response.data is Map<String, dynamic> &&
          response.data['status'] == 200 &&
       
          response.data['data'] is List) {
        final List<dynamic> studentsData = response.data['data'];
        return studentsData.map((json) => ShowStudentModel.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected data structure in the response');
      }
    } catch (e) {
      throw Exception('Failed to get students for group: $e');
    }
  }

   Future<bool> removeStudentFromGroup(int? studentId, int groupId) async {
    try {
      final response = await showStudentServices.delete(
        'student/group/remove',
        queryParameters: {
          'student_id': studentId.toString(),
          'group_id': groupId.toString(),
        },
      );
      
      if (response.data is Map<String, dynamic> && response.data['status'] == 200) {
        return true;
      } else {
        throw Exception('Failed to remove student from group');
      }
    } catch (e) {
      throw Exception('Error removing student from group: $e');
    }
  }
}

 
