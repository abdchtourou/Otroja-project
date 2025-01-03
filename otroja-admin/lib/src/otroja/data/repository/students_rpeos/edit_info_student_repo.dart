import 'package:admins/src/otroja/data/models/student_model/show_students.dart';

import '../../datasource/api_services.dart';

class EditInfoStudentRepo {
  final ApiService _apiService;

  EditInfoStudentRepo(this._apiService);

  Future<void> updateStudent(ShowStudentModel student) async {
    try {
      print(student.toJson());
      final response =
          await _apiService.post('/student/update', data: student.toJsonUpdate());
      if (response.statusCode != 200) {
        throw Exception('Failed to update student: ${response.data['msg']}');
      }
    } catch (e) {
      throw Exception('Failed to update student: $e');
    }
  }
}
