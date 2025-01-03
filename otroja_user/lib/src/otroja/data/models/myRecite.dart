// models/student.dart
class Student {
  final int id;
  final String firstName;
  final String lastName;

  Student({required this.id, required this.firstName, required this.lastName});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}

// models/staff.dart
class Staff {
  final int id;
  final String firstName;
  final String lastName;

  Staff({required this.id, required this.firstName, required this.lastName});

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}

// models/standard.dart
class Standard {
  final int id;
  final String name;
  final int scoreDeduct;
  final int count;

  Standard({
    required this.id,
    required this.name,
    required this.scoreDeduct,
    required this.count,
  });

  factory Standard.fromJson(Map<String, dynamic> json) {
    return Standard(
      id: json['id'],
      name: json['name'],
      scoreDeduct: json['score_deduct'],
      count: json['pivot']['count'],
    );
  }
}

// models/recite.dart
class MyRecite {
  final int id;
  final int studentId;
  final int staffId;
  final int score;
  final String date;
  final int pageNumber;
  final Student student;
  final Staff staff;
  final List<Standard> standards;

  MyRecite({
    required this.id,
    required this.studentId,
    required this.staffId,
    required this.score,
    required this.date,
    required this.pageNumber,
    required this.student,
    required this.staff,
    required this.standards,
  });

  factory MyRecite.fromJson(Map<String, dynamic> json) {
    var standardsJson = json['standards'] as List;
    List<Standard> standardsList = standardsJson.map((i) => Standard.fromJson(i)).toList();

    return MyRecite(
      id: json['id'],
      studentId: json['student_id'],
      staffId: json['staff_id'],
      score: json['score'],
      date: json['date'],
      pageNumber: json['page_number'],
      student: Student.fromJson(json['student']),
      staff: Staff.fromJson(json['staff']),
      standards: standardsList,
    );
  }
}