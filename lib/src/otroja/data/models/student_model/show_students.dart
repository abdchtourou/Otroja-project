class ShowStudentModel {
  int? id;
  int? userId;
  int? parentId;
  int? groupId;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? grade;
  String? address;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  ShowStudentModel(
      {this.id,
        this.userId,
        this.parentId,
        this.groupId,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.grade,
        this.address,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt});

  ShowStudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    parentId = json['parent_id'];
    groupId = json['group_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    grade = json['grade'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['parent_id'] = this.parentId;
    data['group_id'] = this.groupId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['birth_date'] = this.birthDate;
    data['grade'] = this.grade;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}