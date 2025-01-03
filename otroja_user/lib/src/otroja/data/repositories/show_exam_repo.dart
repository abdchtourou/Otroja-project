
import '../../user/model/questions.dart';
import '../datasource/api_services.dart';

class ShowExamRepo {
  ApiService apiService;

  ShowExamRepo(this.apiService);

  Future<List<ShowExamsModel>> showExams() async {
    try {
      final response = await apiService.get('student/get_exams');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        // print(responseData);
        List<dynamic> examsJson = responseData['data'];
        return examsJson.map((json) => ShowExamsModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load Exams: ${e}');
    }
  }
}
