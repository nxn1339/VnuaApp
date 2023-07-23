class MDNew {
  String? title;
  String? content;
  String? img;
  String? time;
  String? view;
  String? keyWord;
  String? id;

  MDNew(
      {this.title,
      this.content,
      this.img,
      this.time,
      this.view,
      this.keyWord,
      this.id});

  MDNew.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['Content'];
    img = json['img'];
    time = json['time'];
    view = json['view'];
    keyWord = json['key_word'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['Content'] = this.content;
    data['img'] = this.img;
    data['time'] = this.time;
    data['view'] = this.view;
    data['key_word'] = this.keyWord;
    data['id'] = this.id;
    return data;
  }
}
