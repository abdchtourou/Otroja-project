class AddActivityModel {
  final String name;
  final String description;
  final String points;

  AddActivityModel({
    required this.name,
    required this.description,
    required this.points,
  });

  factory AddActivityModel.fromJson(Map<String, dynamic> json) {
    return AddActivityModel(
      name: json['name'] as String,
      description: json['description'] as String,
      points: json['points'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'points': points,
    };
  }
}
