class MDNewDetail {
  String? id;
  String? userId;
  String? title;
  String? description;
  String? image;
  String? content;
  String? createAt;
  String? updateAt;
  String? author;

  MDNewDetail(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.image,
      this.content,
      this.createAt,
      this.updateAt,
      this.author});

  factory MDNewDetail.fromJson(Map<String, dynamic> json) {
    return MDNewDetail(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      content: json['content'],
      createAt: json['create_at'],
      updateAt: json['update_at'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['content'] = this.content;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    data['author'] = this.author;
    return data;
  }
}
