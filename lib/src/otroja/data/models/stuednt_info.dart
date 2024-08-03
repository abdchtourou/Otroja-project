// lib/data/models/student_info_model.dart

class StudentInfo {
  final int? studentId;
  final List<Point >?points;
  final List<Absence>? absences;
  final List<Result>? results;

  StudentInfo({
     this.studentId,
     this.points,
     this.absences,
     this.results,
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
  final int? id;
  final int? studentId;
  final int? pointsCount;
  final DateTime?  createdAt;
  final DateTime?  updatedAt;

  Point({
     this.id,
     this.studentId,
     this.pointsCount,
     this.createdAt,
     this.updatedAt,
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
  final int? id;
  final int? studentId;
  final String? groupName;
  final String? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Absence({
     this.id,
     this.studentId,
     this.groupName,
     this.date,
     this.createdAt,
     this.updatedAt,
  });

  factory Absence.fromJson(Map<String, dynamic> json) {
    return Absence(
      id: json['id'],
      studentId: json['student_id'],
      groupName: json['group_name'],
      date:  DateTime.parse(json['date']).toString().substring(0, 10),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Result {
  final int? id;
  final String? examName;
  final int? studentId;
  final int? score;
  final String? createdAt;
  final DateTime? updatedAt;

  Result({
     this.id,
     this.examName,
     this.studentId,
     this.score,
     this.createdAt,
     this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      examName: json['exam_name'],
      studentId: json['student_id'],
      score: json['score'],
      createdAt:  DateTime.parse(json['created_at']).toString().substring(0, 10),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
