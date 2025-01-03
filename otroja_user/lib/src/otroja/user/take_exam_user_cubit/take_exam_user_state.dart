
import 'package:equatable/equatable.dart';

import '../../data/models/exam_details_model.dart';
import '../model/questions.dart';

class TakeExamUserState extends Equatable {
  final List<Question> qaList;
  final List<int> selectedAnswers;
  final int currentQuestionIndex;
  final bool isExamFinished;
  final int correctAnswers;
  final bool showAnswerSelectionError;
  final bool isReviewMode;
   final int remainingTime;

  const TakeExamUserState({
    this.qaList = const [],
    this.selectedAnswers = const [],
    this.currentQuestionIndex = 0,
    this.isExamFinished = false,
    this.correctAnswers = 0,
    this.showAnswerSelectionError = false,
    this.isReviewMode = false,
    this.remainingTime = 600,
  });

  TakeExamUserState copyWith({
    List<Question>? qaList,
    List<int>? selectedAnswers,
    int? currentQuestionIndex,
    bool? isExamFinished,
    int? correctAnswers,
    bool? showAnswerSelectionError,
    bool? isReviewMode,
    int? remainingTime,
  }) {
    return TakeExamUserState(
      qaList: qaList ?? this.qaList,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isExamFinished: isExamFinished ?? this.isExamFinished,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      showAnswerSelectionError: showAnswerSelectionError ?? this.showAnswerSelectionError,
      isReviewMode: isReviewMode ?? this.isReviewMode,
      remainingTime: remainingTime ?? this.remainingTime,
    );
  }

  @override
  List<Object> get props => [
    qaList,
    selectedAnswers,
    currentQuestionIndex,
    isExamFinished,
    correctAnswers,
    showAnswerSelectionError,
    isReviewMode,
    remainingTime,
  ];
}

class TakeExamUserFinishExam extends TakeExamUserState {
  final int correctAnswers;
  final int total;
  final int currentQuestionIndex;
  final List<Question> qaList;

  TakeExamUserFinishExam({
    required this.correctAnswers,
    required this.total,
    required this.currentQuestionIndex,
    required this.qaList,
  }) : super(
    isExamFinished: true,
    correctAnswers: correctAnswers,
    qaList: qaList,
    currentQuestionIndex: currentQuestionIndex,
  );

  @override
  List<Object> get props => [correctAnswers, total, currentQuestionIndex, qaList];
}
