class AbsenceStaffModel {
  String? CourseId;
  List<int> StaffIds=[];
  String? date;

  AbsenceStaffModel({required this.CourseId,required this.StaffIds,required this.date}){
  }

  AbsenceStaffModel.fromJson(Map<String, dynamic> json) {
    CourseId = json['group_id'];
    StaffIds = json['student_ids[]'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.CourseId;
    data['staff_ids'] = this.StaffIds;

    data['date'] = this.date;
    return data;
  }
}