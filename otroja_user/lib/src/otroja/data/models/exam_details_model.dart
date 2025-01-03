class ExamDetailsModel {
  final int id;
  final String name;
  final String date;
  final int duration;
  final int subjectId;
  final List<Question> questions;

  ExamDetailsModel({
    required this.id,
    required this.name,
    required this.date,
    required this.duration,
    required this.subjectId,
    required this.questions,
  });

  factory ExamDetailsModel.fromJson(Map<String, dynamic> json) {
    return ExamDetailsModel(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      duration: json['duration'],
      subjectId: json['subject_id'],
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }
}

class Question {
  final int id;
  final int subjectId;
  final String text;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.subjectId,
    required this.text,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      subjectId: json['subject_id'],
      text: json['text'],
      answers: (json['answers'] as List)
          .map((answerJson) => Answer.fromJson(answerJson))
          .toList(),
    );
  }
}

class Answer {
  final int id;
  final int questionId;
  final String text;
  final bool isCorrect;

  Answer({
    required this.id,
    required this.questionId,
    required this.text,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      questionId: json['question_id'],
      text: json['text'],
      isCorrect: json['is_correct'] == 1,
    );
  }
}
