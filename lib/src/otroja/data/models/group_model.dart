class Group {
  final int? id;
  final int staffId;
  final int courseLevelId;
  final String name;
   final List<int>? studentIds;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Group({
    this.id,
    required this.staffId,
    required this.courseLevelId,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.studentIds,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      staffId: json['staff_id'],
      courseLevelId: json['course_level_id'],
      name: json['name'],
      studentIds: List<int>.from(json['student_ids']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'staff_id': staffId,
      'course_level_id': courseLevelId,
      'name': name,
      'student_ids': studentIds,
    };
  }
}