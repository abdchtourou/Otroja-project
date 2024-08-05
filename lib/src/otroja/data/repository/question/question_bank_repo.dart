// repositories/question_repository.dart

import 'dart:convert';

import 'package:admins/src/otroja/data/models/questinos_model.dart';

import '../../../presentation/screens/Exams/qustion/qustion.dart';
import '../../datasource/api_services.dart';
import '../../models/Exam/question_bank_model/question_bank_model.dart';
class QuestionBankRepository {
  ApiService apiService;


  QuestionBankRepository(this.apiService);



  Future<List<QuestionBankModel>> fetchQuestions() async {
    final response = await apiService.get("questions");

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data;

      List<dynamic> questionsJson = responseData['data'];

      List<QuestionBankModel> questions = questionsJson.map((json) => QuestionBankModel.fromJson(json)).toList();

      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }

}
