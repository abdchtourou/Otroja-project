class Staff {
   int? id;
   int? userId;
   int? roleId;
   String? firstName;
   String? lastName;
   String? userName;
   String? password;
   String? phoneNumber;
   DateTime? createdAt;
   DateTime? updatedAt;

  Staff({
     this.id,
     this.userId,
     this.roleId,
     this.firstName,
     this.lastName,
     this.phoneNumber,
     this.userName,
     this.password,
     this.createdAt,
     this.updatedAt,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'],
      userId: json['user_id'],
      roleId: json['role_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'password': password,
      'password_confirmation': password,
      'role_id': roleId,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
     
    };
  }
}