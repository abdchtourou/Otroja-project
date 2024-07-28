class AbsenceModel {
  String? groupId;
  List<int> studentIds=[];
  String? date;

  AbsenceModel({required this.groupId,required this.studentIds,required this.date}){
  }

  AbsenceModel.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'];
    studentIds = json['student_ids[]'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group_id'] = this.groupId;
    data['student_ids'] = this.studentIds;

    data['date'] = this.date;
    return data;
  }
}