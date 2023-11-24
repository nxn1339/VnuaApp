class MDAdviseDetail {
  String? id;
  int? isReaded;
  String? name;
  String? phone;
  String? email;
  String? content;
  String? createAt;

  MDAdviseDetail(
      {this.id,
      this.isReaded,
      this.name,
      this.phone,
      this.email,
      this.content,
      this.createAt});

  MDAdviseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isReaded = json['is_readed'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    content = json['content'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_readed'] = this.isReaded;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['content'] = this.content;
    data['create_at'] = this.createAt;
    return data;
  }
}
