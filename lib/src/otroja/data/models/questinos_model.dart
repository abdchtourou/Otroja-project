class QuestionAnswersWrapper {
  final List<QuestionModel> questionAnswers;

  QuestionAnswersWrapper({
    required this.questionAnswers,
  });

  factory QuestionAnswersWrapper.fromJson(Map<String, dynamic> json) {
    return QuestionAnswersWrapper(
      questionAnswers: (json['question_answers'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_answers': questionAnswers.map((e) => e.toJson()).toList(),
    };
  }
}

class QuestionModel {
  final String question;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answers': answers.map((e) => e.toJson()).toList(),
    };
  }
}

class AnswerModel {
  final String text;
  final bool isCorrect;

  AnswerModel({
    required this.text,
    required this.isCorrect,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      text: json['text'] as String,
      isCorrect: json['is_correct'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'is_correct': isCorrect,
    };
  }
}
