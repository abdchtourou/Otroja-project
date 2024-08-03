import 'dart:math';

class ShowStudentModel {
  int? id;
  int? userId;
  int? parentId;
  int? groupId;
  int? points;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? birthDate;
  String? grade;
  String? address;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  ShowStudentModel(
      {this.id,
      this.userName,
      this.userId,
      this.parentId,
      this.groupId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
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
    points = json['points'];
    lastName = json['last_name'];
    email = json['email'];
    birthDate = json['birth_date'];
    grade = json['grade'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'password': password,
      'password_confirmation': password,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'parent_id': parentId,
      'phone_number': phoneNumber,
      'address': address,
      'birth_date': birthDate,
      'grade': grade,
      'group_id': grade,
    };
  }
}
