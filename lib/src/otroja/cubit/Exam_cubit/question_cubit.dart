import 'dart:convert';

import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_state.dart';
import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/subjects_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/questinos_model.dart';
import '../../data/repository/subjects_repo.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final questionController = TextEditingController();
  final List<TextEditingController> answerControllers =
      List.generate(4, (index) => TextEditingController());
  SubjectsRepo subjectsRepo;
  QuestionCubit(this.subjectsRepo) : super(const QuestionState()) {
    _updateControllers();
    getAllSubjects();
    print('//////////////////////////////////// zed|');
  }

  void addQuestionAnswer(BuildContext context) {
    final question = questionController.text;
    final answers = List.generate(4, (index) {
      final text = answerControllers[index].text;
      final isCorrect = state.selectedAnswerIndex - 1 == index;
      return AnswerModel(text: text, isCorrect: isCorrect);
    });

    final questionModel = QuestionModel(
      question: question,
      answers: answers,
    );

    final isQuestionFilled = question.isNotEmpty;
    final areAnswersFilled = answers.every((answer) => answer.text.isNotEmpty);
    final isAnswerSelected = state.selectedAnswerIndex != -1;

    if (isQuestionFilled && areAnswersFilled && isAnswerSelected) {
      final updatedQaList = List<QuestionModel>.from(state.qaList);
      if (state.currentQuestionIndex < updatedQaList.length) {
        updatedQaList[state.currentQuestionIndex] = questionModel;
      } else {
        updatedQaList.add(questionModel);
      }
      emit(state.copyWith(
        qaList: updatedQaList,
        currentQuestionIndex: state.currentQuestionIndex + 1,
        selectedAnswerIndex: -1, // Reset selected answer
      ));
      _clearControllers();
      _updateControllers();
    } else {
      String errorMessage;
      if (!isQuestionFilled) {
        errorMessage = ". الرجاء ملء حقل السؤال";
      } else if (!areAnswersFilled) {
        errorMessage = ". الرجاء ملء كافة حقول الإجابة";
      } else if (!isAnswerSelected) {
        errorMessage = "اختر الإجابة الصحيحة";
      } else {
        errorMessage = ". الرجاء ملء كافة الحقول";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: OtrojaColors.primaryColor,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void goBack() {
    if (state.currentQuestionIndex > 0) {
      emit(state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex - 1,
      ));
      _updateControllers();
    }
  }

  void selectAnswer(int index) {
    emit(state.copyWith(selectedAnswerIndex: index));
  }

  void _updateControllers() {
    if (state.currentQuestionIndex < state.qaList.length) {
      final currentQuestion = state.qaList[state.currentQuestionIndex];
      questionController.text = currentQuestion.question;
      for (int i = 0; i < answerControllers.length; i++) {
        answerControllers[i].text = i < currentQuestion.answers.length
            ? currentQuestion.answers[i].text
            : '';
      }
      final correctAnswerIndex =
          currentQuestion.answers.indexWhere((answer) => answer.isCorrect);
      emit(state.copyWith(selectedAnswerIndex: correctAnswerIndex));
    } else {
      _clearControllers();
    }
  }

  void _clearControllers() {
    questionController.clear();
    for (var controller in answerControllers) {
      controller.clear();
    }
  }

  ApiService dio = ApiService();

  void printQuestion() async {
    List test = [];
    for (var data in state.qaList) {
      final questionModel = data;
      final questionJson = questionModel.toJson();
      test.add(questionJson);
    }
    print(state.qaList);
    print(test);
    try {
      var data =
          {
        'subject_id': subjectId,
        'question_answers': test
      };
      print(subjectId);

      var dio = Dio();
      var response = await dio.request(
        'http://192.168.1.102:8000/api/questions/questions_answers',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      emit(QuestionSubjectSend());

      if (response.statusCode == 201) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  List<SubjectsModel> listSubject=[];
  Map<String, int> subjectsId = {};

  int? subjectId;
  // Future<void> postQuestionAnswers() async {
  //   List test = [];
  //   for (var data in state.qaList) {
  //     final questionModel = data;
  //     final questionJson = questionModel.toJson();
  //     test.add(questionJson);
  //   }
  //   print(state.qaList);
  //   print(test);
  //   try {
  //     var data ={
  //       "subject_id": subjectId,
  //       "question_answers": test
  //     };
  //     print(subjectId);
  //
  //     var dio = Dio();
  //     var response = await dio.post(
  //       'http://192.168.1.102:8000/api/questions/questions_answers',
  //       data: jsonEncode(data),
  //       options: Options(
  //         headers: {'Content-Type': 'application/json'},
  //       ),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       print(jsonEncode(response.data));
  //     } else {
  //       print('Error: ${response.statusCode} - ${response.statusMessage}');
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //   }
  // }
  List<String> subjectNames = [];
  Future<void> getAllSubjects() async{
    emit(QuestionSubjectLoading());
    try{
      print('//////////////////////////// cinit');
      listSubject = await subjectsRepo.getSubjects();
      emit(QuestionSubjectLoaded());


      for (var element in listSubject) {
        subjectNames.add(element.name!);
        subjectsId[element.name!] = element.id!;
      }
      print(subjectNames);
    }catch(e){}



  }

}
