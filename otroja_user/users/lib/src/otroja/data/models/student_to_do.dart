class Student {
  final int id;
  final String firstName;
  final String lastName;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}