class getGroupsModel {
  int? id;
  int? staffId;
  int? courseLevelId;
  String? name;
  String? createdAt;
  String? updatedAt;

  getGroupsModel(
      {this.id,
        this.staffId,
        this.courseLevelId,
        this.name,
        this.createdAt,
        this.updatedAt});

  getGroupsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffId = json['staff_id'];
    courseLevelId = json['course_level_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['staff_id'] = this.staffId;
    data['course_level_id'] = this.courseLevelId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}