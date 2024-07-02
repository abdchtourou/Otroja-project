class Group {
  final int id;
  final int staffId;
  final int courseLevelId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Group({
    required this.id,
    required this.staffId,
    required this.courseLevelId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      staffId: json['staff_id'],
      courseLevelId: json['course_level_id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staff_id': staffId,
      'course_level_id': courseLevelId,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}