class ShowActivityModel {
  String? name;
  int? points;
  String? description;

  ShowActivityModel({this.name, this.points, this.description});

  ShowActivityModel.fromJson(Map<String, dynamic> json) {
    print('in model $json');
    name = json['name'];
    points = json['points'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['points'] = this.points;
    data['description'] = this.description;
    return data;
  }
}