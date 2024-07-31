class Subject {
  String? id;
  String? name;
  CategoryName? categoryName;

  Subject({this.id, this.name, this.categoryName});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryName = json['category_name'] != null
        ? new CategoryName.fromJson(json['category_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.categoryName != null) {
      data['category_name'] = this.categoryName!.toJson();
    }
    return data;
  }
}

class CategoryName {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CategoryName({this.id, this.name, this.createdAt, this.updatedAt});

  CategoryName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}