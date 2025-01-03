class Document {
  final String description;
  final String type;
  final String url;


  Document({required this.description, required this.type, required this.url});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      description: json['description'],
      type: json['type'],
      url: json['url'],
    );
  }
}