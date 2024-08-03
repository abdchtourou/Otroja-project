import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final questionController = TextEditingController();
  final List<TextEditingController> answerControllers =
  List.generate(4, (index) => TextEditingController());

  QuestionCubit() : super(const QuestionState()) {
    _updateControllers();
  }

  void addQuestionAnswer(BuildContext context) {
    final question = questionController.text;
    final answers = answerControllers.map((controller) => controller.text).toList();

    bool isQuestionFilled = question.isNotEmpty;
    bool areAnswersFilled = answers.every((answer) => answer.isNotEmpty);
    bool isAnswerSelected = state.selectedAnswerIndex != -1;

    if (isQuestionFilled && areAnswersFilled && isAnswerSelected) {
      final updatedQaList = List<Map<String, String>>.from(state.qaList);
      if (state.currentQuestionIndex < updatedQaList.length) {
        updatedQaList[state.currentQuestionIndex] = {
          'question': question,
          'answers': answers.join(', '),
          'correctAnswer': state.selectedAnswerIndex.toString(),
        };
      } else {
        updatedQaList.add({
          'question': question,
          'answers': answers.join(', '),
          'correctAnswer': state.selectedAnswerIndex.toString(),
        });
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
      if (!isQuestionFilled&&!areAnswersFilled) {
        errorMessage = ". الرجاء ملء حقلي السؤال والإجابة";
      } else if (!areAnswersFilled) {
        errorMessage = ". الرجاء ملء حقلي السؤال والإجابة";
      } else if (!isAnswerSelected) {
        errorMessage = "اختر الإجابة الصحيحة";
      } else {
        errorMessage = ". الرجاء ملء حقلي السؤال والإجابة";
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
      questionController.text = currentQuestion['question'] ?? '';
      final answers = currentQuestion['answers']?.split(', ') ?? [];
      for (int i = 0; i < answerControllers.length; i++) {
        answerControllers[i].text = i < answers.length ? answers[i] : '';
      }
      final correctAnswerIndex =
          int.tryParse(currentQuestion['correctAnswer'] ?? '-1') ?? -1;
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
}
