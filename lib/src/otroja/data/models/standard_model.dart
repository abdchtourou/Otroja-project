class Standard {
  final int id;
  final String name;
  final int scoreDeduct;
  final DateTime createdAt;
  final DateTime updatedAt;

  Standard({
    required this.id,
    required this.name,
    required this.scoreDeduct,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Standard.fromJson(Map<String, dynamic> json) {
    return Standard(
      id: json['id'],
      name: json['name'],
      scoreDeduct: json['score_deduct'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score_deduct': scoreDeduct,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}