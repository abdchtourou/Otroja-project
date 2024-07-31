class Group {
  final int? id;
  final int? staffId;
  final int? courseLevelId;
  final String name;
  final String? staffName;
  final String? courseName;
  final int? studentsCount;
  final List<int>? studentIds;
  final String? createdAt;
  final DateTime? updatedAt;

  Group(
      {this.id,
      this.staffId,
      this.courseLevelId,
      required this.name,
      this.createdAt,
      this.updatedAt,
      this.studentIds,
      this.courseName,
      this.staffName,
      this.studentsCount});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      staffName: json['staff_name'],
      courseName: json['course_name'],
      studentsCount: json['student_count'],
      createdAt: DateTime.parse(json['created_at']).toString().substring(0, 10), 
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
