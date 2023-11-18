class MDAdvise {
  String? id;
  int? isReaded;
  String? name;
  String? phone;
  String? createAt;

  MDAdvise({this.id, this.isReaded, this.name, this.phone, this.createAt});

  MDAdvise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isReaded = json['is_readed'];
    name = json['name'];
    phone = json['phone'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_readed'] = this.isReaded;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['create_at'] = this.createAt;
    return data;
  }
}
