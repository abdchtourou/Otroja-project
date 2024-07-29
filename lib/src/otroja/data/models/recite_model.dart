class Recite  {
  final String date;
  final String studentId;
  final String reciteTypeId;
  final List<StandardCount> standardCounts;

  const Recite({
    required this.date,
    required this.studentId,
    required this.reciteTypeId,
    required this.standardCounts,
  });

  factory Recite.fromJson(Map<String, dynamic> json) {
    return Recite(
      date: json['date'],
      studentId: json['student_id'],
      reciteTypeId: json['recite_type_id'],
      standardCounts: (json['standard_ids'] as List)
          .map((item) => StandardCount.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'student_id': studentId,
      'recite_type_id': reciteTypeId,
      'standard_ids': standardCounts.map((sc) => sc.toJson()).toList(),
    };
  }

}

class StandardCount {
  final int id;
  final int count;

  const StandardCount({required this.id, required this.count});

  factory StandardCount.fromJson(Map<String, dynamic> json) {
    return StandardCount(
      id: json['id'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
    };
  }

}