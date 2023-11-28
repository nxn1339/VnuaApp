class MDQuestion {
  String? id;
  String? content;
  List<Answer>? answer;

  MDQuestion({this.id, this.content, this.answer});

  MDQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  String? id;
  String? content;
  int? most;
  int? least;

  Answer({this.id, this.content, this.most, this.least});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    most = json['most'];
    least = json['least'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['most'] = this.most;
    data['least'] = this.least;
    return data;
  }
}
