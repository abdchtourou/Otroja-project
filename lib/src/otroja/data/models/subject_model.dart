class Subject {
  final int id;
  final String name;
  final String categoryName;

  Subject({
    required this.id,
    required this.name,
    required this.categoryName,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      categoryName: json['category_name']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_name': categoryName,
    };
  }
}
