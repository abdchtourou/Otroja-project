import 'package:equatable/equatable.dart';

class QuestionState extends Equatable {
  final List<Map<String, String>> qaList;
  final int currentQuestionIndex;
  final int totalQuestions;
  final int selectedAnswerIndex;

  const QuestionState({
    this.qaList = const [],
    this.currentQuestionIndex = 0,
    this.totalQuestions = 20,
    this.selectedAnswerIndex = -1,
  });

  QuestionState copyWith({
    List<Map<String, String>>? qaList,
    int? currentQuestionIndex,
    int? totalQuestions,
    int? selectedAnswerIndex,
  }) {
    return QuestionState(
      qaList: qaList ?? this.qaList,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
    );
  }

  @override
  List<Object?> get props => [qaList, currentQuestionIndex, totalQuestions, selectedAnswerIndex];
}