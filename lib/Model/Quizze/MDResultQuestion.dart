class MDResultQuestion {
  Base? base1;
  Result? result;
  List<Field>? field;

  MDResultQuestion({this.base1, this.result, this.field});

  MDResultQuestion.fromJson(Map<String, dynamic> json) {
    base1 = json['base'] != null ? new Base.fromJson(json['base']) : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    if (json['field'] != null) {
      field = <Field>[];
      json['field'].forEach((v) {
        field!.add(new Field.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.base1 != null) {
      data['base'] = this.base1!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    if (this.field != null) {
      data['field'] = this.field!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Base {
  Most? most;
  Most? least;

  Base({this.most, this.least});

  Base.fromJson(Map<String, dynamic> json) {
    most = json['most'] != null ? new Most.fromJson(json['most']) : null;
    least = json['least'] != null ? new Most.fromJson(json['least']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.most != null) {
      data['most'] = this.most!.toJson();
    }
    if (this.least != null) {
      data['least'] = this.least!.toJson();
    }
    return data;
  }
}

class Most {
  String? s1;
  String? s2;
  String? s3;
  String? s4;

  Most({this.s1, this.s2, this.s3, this.s4});

  Most.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    return data;
  }
}

class Result {
  String? id;
  String? name;
  String? content;

  Result({this.id, this.name, this.content});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    return data;
  }
}

class Field {
  String? id;
  String? name;

  Field({this.id, this.name});

  Field.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
