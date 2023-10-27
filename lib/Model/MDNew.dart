class MDNew {
  String? id;
  String? title;
  String? description;
  String? image;
  String? author;

  MDNew({this.id, this.title, this.description, this.image, this.author});

  MDNew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['author'] = this.author;
    return data;
  }
}
