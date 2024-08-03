// lib/data/models/student_info_model.dart

class StudentInfo {
  final int studentId;
  final List<Point> points;
  final List<Absence> absences;
  final List<Result> results;

  StudentInfo({
    required this.studentId,
    required this.points,
    required this.absences,
    required this.results,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) {
    return StudentInfo(
      studentId: json['student_id'],
      points: (json['points'] as List)
          .map((point) => Point.fromJson(point))
          .toList(),
      absences: (json['absences'] as List)
          .map((absence) => Absence.fromJson(absence))
          .toList(),
      results: (json['results'] as List)
          .map((result) => Result.fromJson(result))
          .toList(),
    );
  }
}

class Point {
  final int id;
  final int studentId;
  final int pointsCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Point({
    required this.id,
    required this.studentId,
    required this.pointsCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      id: json['id'],
      studentId: json['student_id'],
      pointsCount: json['points_count'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Absence {
  final int id;
  final int studentId;
  final int groupId;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;

  Absence({
    required this.id,
    required this.studentId,
    required this.groupId,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Absence.fromJson(Map<String, dynamic> json) {
    return Absence(
      id: json['id'],
      studentId: json['student_id'],
      groupId: json['group_id'],
      date: DateTime.parse(json['date']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Result {
  final int id;
  final int examId;
  final int studentId;
  final int score;
  final DateTime createdAt;
  final DateTime updatedAt;

  Result({
    required this.id,
    required this.examId,
    required this.studentId,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      examId: json['exam_id'],
      studentId: json['student_id'],
      score: json['score'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
