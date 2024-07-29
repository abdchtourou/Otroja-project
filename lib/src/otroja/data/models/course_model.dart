class Course {
  final int id;
  final String name;
  final String startDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Level> levels;

  Course({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.levels,
    required this.startDate
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      startDate: json['start_date'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      levels: (json['levels'] as List<dynamic>)
          .map((levelJson) => Level.fromJson(levelJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_date': startDate,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'levels': levels.map((level) => level.toJson()).toList(),
    };
  }
}

class Level {
  final String name;
  final LevelPivot pivot;

  Level({
    required this.name,
    required this.pivot,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      name: json['name'],
      pivot: LevelPivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pivot': pivot.toJson(),
    };
  }
}

class LevelPivot {
  final int courseId;
  final int levelId;
  final int id;

  LevelPivot({
    required this.id,
    required this.courseId,
    required this.levelId,
  });

  factory LevelPivot.fromJson(Map<String, dynamic> json) {
    return LevelPivot(
      id: json['id'],
      courseId: json['course_id'],
      levelId: json['level_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'level_id': levelId,
    };
  }
}
