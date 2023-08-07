class MDNewDetail {
  int? id;
  String? title;
  String? image;
  String? content;
  String? description;
  String? author;
  String? publishDate;
  String? createdAt;
  String? updatedAt;

  MDNewDetail(
      {this.id,
      this.title,
      this.image,
      this.content,
      this.description,
      this.author,
      this.publishDate,
      this.createdAt,
      this.updatedAt});

  MDNewDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    description = json['description'];
    author = json['author'];
    publishDate = json['publish_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['content'] = this.content;
    data['description'] = this.description;
    data['author'] = this.author;
    data['publish_date'] = this.publishDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
