import '../../../data/models/Exam/question_bank_model/question_bank_model.dart';



abstract class QuestionBankState {}

class QuestionInitial extends QuestionBankState {}

class QuestionLoading extends QuestionBankState {}

class QuestionLoaded extends QuestionBankState {
  final List<QuestionBankModel> questions;

  QuestionLoaded(this.questions);
}

class QuestionError extends QuestionBankState {
  final String message;

  QuestionError(this.message);
}
