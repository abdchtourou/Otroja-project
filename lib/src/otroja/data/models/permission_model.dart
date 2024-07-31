// lib/data/models/permission_model.dart

class Permission {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Staff> staffs;

  Permission({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.staffs,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      staffs: (json['staffs'] as List).map((e) => Staff.fromJson(e)).toList(),
    );
  }
}

class Staff {
  final int id;
  final int userId;
  final int roleId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  Staff({
    required this.id,
    required this.userId,
    required this.roleId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
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
}