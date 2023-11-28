class MDPackage {
  String? id;
  String? name;
  String? avatar;
  String? description;
  int? time;

  MDPackage({this.id, this.name, this.avatar, this.description, this.time});

  MDPackage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    description = json['description'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['description'] = this.description;
    data['time'] = this.time;
    return data;
  }
}
