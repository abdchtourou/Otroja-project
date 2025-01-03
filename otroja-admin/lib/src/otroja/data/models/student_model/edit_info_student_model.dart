class EditInfoStudentModel {
  String groupId;
  String studentId;
  String firstName;
  String password;
  String birthDate;

  String address;
  String phoneNumber;

  EditInfoStudentModel({
    required this.studentId,
    required this.groupId,
    required this.firstName,
    required this.password,
    required this.birthDate,
    required this.address,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (groupId.isNotEmpty ) {
      data['group_id'] = groupId;
    }
    if (firstName.isNotEmpty ) {
      data['first_name'] = firstName;
    }
    if (birthDate.isNotEmpty ) {
      data['birth_date'] = birthDate;
    }
    if (address.isNotEmpty ) {
      data['address'] = address;
    }
    if (phoneNumber.isNotEmpty ) {
      data['phone_number'] = phoneNumber;
    }
    if (studentId.isNotEmpty ) {
      data['student_id'] = studentId;
    }

    return data;
  }
}
