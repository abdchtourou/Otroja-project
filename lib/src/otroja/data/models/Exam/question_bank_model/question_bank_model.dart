

class QuestionBankModel {
  final int id;
  final int subjectId;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Answer> answers;

  QuestionBankModel({
    required this.id,
    required this.subjectId,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.answers,
  });

  factory QuestionBankModel.fromJson(Map<String, dynamic> json) {
    return QuestionBankModel(
      id: json['id'],
      subjectId: json['subject_id'],
      text: json['text'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      answers: List<Answer>.from(json['answers'].map((x) => Answer.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject_id': subjectId,
      'text': text,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'answers': List<dynamic>.from(answers.map((x) => x.toJson())),
    };
  }
}

class Answer {
  final int id;
  final int questionId;
  final String text;
  final int isCorrect;
  final DateTime createdAt;
  final DateTime updatedAt;

  Answer({
    required this.id,
    required this.questionId,
    required this.text,
    required this.isCorrect,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      questionId: json['question_id'],
      text: json['text'],
      isCorrect: json['is_correct'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_id': questionId,
      'text': text,
      'is_correct': isCorrect,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
