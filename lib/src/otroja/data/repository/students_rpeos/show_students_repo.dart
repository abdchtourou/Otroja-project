import 'package:admins/src/otroja/data/models/student_model/show_students.dart';

import '../../datasource/api_services.dart';

class ShowStudentsRepo {
  final ApiService showStudentServices;

  ShowStudentsRepo(this.showStudentServices);

  getStudents(page) async {
    print('/////////////////////in repo');
    final students = await showStudentServices.get("students?page=$page");

    return students.data;
  }

  Future<int> registerStudent(ShowStudentModel student) async {
    try {
      print(student.toJson());
      final response = await showStudentServices.post(
        'register/student',
        data: student.toJson(),
      );
      return response.data['status'];
    } catch (e) {
      throw Exception('Failed to register student: $e');
    }
  }

  Future<List<ShowStudentModel>> getStudentsByGroupId(int groupId) async {
    try {
      final response = await showStudentServices
          .get('/group/students', queryParameters: {'group_id': groupId});
      if (response.statusCode == 200) {
        print(response);
        final List<dynamic> data = response.data['data'];
        return data.map((json) => ShowStudentModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      throw Exception('Failed to load students: $e');
    }
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
          return studentsData
              .map((json) => ShowStudentModel.fromJson(json))
              .toList();
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

  // Future<List<ShowStudentModel>> getStudentsByGroupId(int groupId) async {
  //   try {
  //     final response = await showStudentServices.get('group/students', queryParameters: {'group_id': groupId.toString()});

  //     if (response.data is Map<String, dynamic> &&
  //         response.data['status'] == 200 &&

  //         response.data['data'] is List) {
  //       final List<dynamic> studentsData = response.data['data'];
  //       return studentsData.map((json) => ShowStudentModel.fromJson(json)).toList();
  //     } else {
  //       throw Exception('Unexpected data structure in the response');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to get students for group: $e');
  //   }
  // }

  Future<bool> addStudentsToGroup(int groupId, List<int> studentIds) async {
    try {
      final response = await showStudentServices.post(
        'student/group/add',
        data: {
          'group_id': groupId,
          'students_id': studentIds,
        },
      );
      print(response);

      if (response.data['status'] == 200) {
        return true;
      } else {
        throw Exception('Failed to add students to group');
      }
    } catch (e) {
      throw Exception('Error adding students to group: $e');
    }
  }

  Future<bool> removeStudentFromGroup(int? studentId, int groupId) async {
    try {
      final response = await showStudentServices.delete(
        'student/group/remove',
        queryParameters: {
          'student_id': studentId,
          'group_id': groupId,
        },
      );

      if (response.data['status'] == 200) {
        return true;
      } else {
        throw Exception('Failed to remove student from group');
      }
    } catch (e) {
      throw Exception('Error removing student from group: $e');
    }
  }
}
