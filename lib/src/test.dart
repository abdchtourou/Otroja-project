import 'package:admins/src/otroja/data/models/Exam/create_exam.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart'
    '';
class ApiService {
  final Dio _dio = Dio();

  Future<void> createExam(CreateExamModel  exam) async {
    final String url = 'http://192.168.1.102:8000/api/exams/create';

    try {
      Response response = await _dio.post(
        url,
        data: exam.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle success
        print('Exam created successfully: ${response.data}');
      } else {
        // Handle other status codes
        print('Failed to create exam: ${response.statusMessage}');
      }
    } catch (e) {
      // Handle error
      print('Error creating exam: $e');
    }
  }
}




class MyHomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  void _createExam() {
    // Create an instance of Exam
    CreateExamModel exam = CreateExamModel(
      name: 'exam1',
      subjectId: '1',
      date: '2001-09-28',
      questionIds: [1],
      duration: 30,
      groupIds: [1],
    );

    // Send the exam using the ApiService
    apiService.createExam(exam);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Creator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _createExam,
          child: Text('Create Exam'),
        ),
      ),
    );
  }
}
