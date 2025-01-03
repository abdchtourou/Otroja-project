import 'package:otroja_users/src/otroja/data/datasource/api_services.dart';
import 'package:otroja_users/src/otroja/data/models/exam_details_model.dart';

import '../../user/model/questions.dart';

class ExamDetailsRepo{
  ApiService apiService;

  ExamDetailsRepo(this.apiService);
  Future<ExamDetailsModel> fetchExam(int examId) async {
    try {
      final response = await apiService.get('student/get_exam_questions/$examId ');
      if (response.statusCode == 200) {
        return ExamDetailsModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load exam');
      }
    } catch (e) {
      throw Exception('Failed to load exam: $e');
    }
  }
}