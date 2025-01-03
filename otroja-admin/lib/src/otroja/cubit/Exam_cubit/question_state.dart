import 'package:admins/src/otroja/data/models/questinos_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/subjects_model.dart';

class QuestionState extends Equatable {
  final List<QuestionModel> qaList;
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
    List<QuestionModel>? qaList,
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
class QuestionSubjectLoading extends QuestionState{}
class QuestionSubjectSend extends QuestionState{}
class QuestionSubjectLoaded extends QuestionState{
}
