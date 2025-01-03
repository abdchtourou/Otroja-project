// lib/data/models/student_info_model.dart

class StudentInfo {
  final StudentProfile? studentProfile;
  final List<Point>? points;
  final List<Absence>? absences;
  final List<Result>? results;

  StudentInfo({
    this.studentProfile,
    this.points,
    this.absences,
    this.results,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) {
    return StudentInfo(
      studentProfile: json['student_profile'] != null
          ? StudentProfile.fromJson(json['student_profile'])
          : null,
      points: (json['points'] as List?)
          ?.map((point) => Point.fromJson(point))
          .toList(),
      absences: (json['absences'] as List?)
          ?.map((absence) => Absence.fromJson(absence))
          .toList(),
      results: (json['results'] as List?)
          ?.map((result) => Result.fromJson(result))
          .toList(),
    );
  }
}

class StudentProfile {
  final int? id;
  final int? userId;
  final int? parentId;
  final String? firstName;
  final String? lastName;
  final String? birthDate;
  final String? grade;
  final String? address;
  final String? phoneNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? points;
  final dynamic pivot;

  StudentProfile({
    this.id,
    this.userId,
    this.parentId,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.grade,
    this.address,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.points,
    this.pivot,
  });

  factory StudentProfile.fromJson(Map<String, dynamic> json) {
    return StudentProfile(
      id: json['id'],
      userId: json['user_id'],
      parentId: json['parent_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthDate: json['birth_date'],
      grade: json['grade'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      points: json['points'],
      pivot: json['pivot'],
    );
  }
}

class Point {
  final int? id;
  final int? studentId;
  final int? pointsCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
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
      date: json['date'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
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
      createdAt: json['created_at'] != null ?  DateTime.parse(json['created_at']).toString().substring(0, 10) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}