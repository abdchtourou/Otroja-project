// lib/models/parent.dart

class Parent {
  final String userName;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String profession;

  Parent({
    required this.userName,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profession,
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