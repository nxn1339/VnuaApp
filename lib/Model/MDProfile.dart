class MDProfile {
  String? id;
  String? name;
  String? avatar;
  int? gender;
  String? birthDay;
  String? phone;
  String? email;
  int? permission;
  String? createAt;
  String? updateAt;

  MDProfile(
      {this.id,
      this.name,
      this.avatar,
      this.gender,
      this.birthDay,
      this.phone,
      this.email,
      this.permission,
      this.createAt,
      this.updateAt});

  MDProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    gender = json['gender'];
    birthDay = json['birth_day'];
    phone = json['phone'];
    email = json['email'];
    permission = json['permission'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['birth_day'] = this.birthDay;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['permission'] = this.permission;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
