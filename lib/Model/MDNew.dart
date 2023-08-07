class MDNew {
  int? id;
  String? title;
  String? image;
  String? description;
  String? publishDate;

  MDNew({this.id, this.title, this.image, this.description, this.publishDate});

  MDNew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    publishDate = json['publish_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['publish_date'] = this.publishDate;
    return data;
  }
}
