class ShowExamsModel {
  int? id;
  String? name;
  String? date;
  int? duration;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  List<Questions>? questions;

  ShowExamsModel(
      {this.id,
        this.name,
        this.date,
        this.duration,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
        this.questions,
      });

  ShowExamsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    duration = json['duration'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date;
    data['duration'] = this.duration;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Questions {
  int? id;
  int? subjectId;
  String? text;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<Answers>? answers;

  Questions(
      {this.id,
        this.subjectId,
        this.text,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    data['text'] = this.text;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? examId;
  int? questionId;

  Pivot({this.examId, this.questionId});

  Pivot.fromJson(Map<String, dynamic> json) {
    examId = json['exam_id'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_id'] = this.examId;
    data['question_id'] = this.questionId;
    return data;
  }
}

class Answers {
  int? id;
  int? questionId;
  String? text;
  int? isCorrect;
  String? createdAt;
  String? updatedAt;

  Answers(
      {this.id,
        this.questionId,
        this.text,
        this.isCorrect,
        this.createdAt,
        this.updatedAt});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    text = json['text'];
    isCorrect = json['is_correct'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_id'] = this.questionId;
    data['text'] = this.text;
    data['is_correct'] = this.isCorrect;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}