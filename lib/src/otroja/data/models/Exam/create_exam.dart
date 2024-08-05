class CreateExamModel {
  String name;
  var subjectId;
  String date;
  List<int> questionIds;
  int duration;
  List<int> groupIds;

  CreateExamModel({
    required this.name,
    required this.subjectId,
    required this.date,
    required this.questionIds,
    required this.duration,
    required this.groupIds,
  });

  factory CreateExamModel.fromJson(Map<String, dynamic> json) {
    return CreateExamModel(
      name: json['name'] as String,
      subjectId: json['subject_id'] as String,
      date: json['date'],
      questionIds: List<int>.from(json['question_ids[]'] as List),
      duration: json['duration'] as int,
      groupIds: List<int>.from(json['group_ids[]'] as List),
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'name': name,
      'subject_id': subjectId,
      'date': date,
      'question_ids':questionIds,
      'duration': duration,
      'group_ids': groupIds,
    };
  }
}
