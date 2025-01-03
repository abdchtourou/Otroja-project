class SendResult {
  int? examId;
  int? score;

  SendResult({
    required this.examId,required this.score});

  SendResult.fromJson(Map<String, dynamic> json) {
    examId = json['exam_id'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_id'] = this.examId;
    data['score'] = this.score;
    return data;
  }
}