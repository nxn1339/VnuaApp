class MDSlide {
  String? avatar;
  String? id;

  MDSlide({this.avatar, this.id});

  MDSlide.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    return data;
  }
}
