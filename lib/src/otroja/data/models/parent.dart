// lib/models/parent.dart

class Parent {
   int? id;
   int? userId;
   String ?userName;
   String? email;
   String? password;
   String? firstName;
   String? lastName;
   String? phoneNumber;
   String? profession;

  Parent({
    this.id,
    this.userId,
     this.userName,
     this.email,
     this.password,
     this.firstName,
     this.lastName,
     this.phoneNumber,
     this.profession,
  });

  Map<String, dynamic> toJson() {
    return {

      'user_name': userName,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'profession': profession,
    };
  }

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      id: json['id'],
      userId: json['user_id'],
      userName: json['user_name'],
      email: json['email'],
      password: json['password'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      profession: json['profession'],
    );
  }
}
