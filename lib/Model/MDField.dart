class MDField {
  String? id;
  String? name;
  List<Specialized>? specialized;

  MDField({this.id, this.name, this.specialized});

  MDField.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['specialized'] != null) {
      specialized = <Specialized>[];
      json['specialized'].forEach((v) {
        specialized!.add(new Specialized.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.specialized != null) {
      data['specialized'] = this.specialized!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specialized {
  String? id;
  int? type;
  String? name;

  Specialized({this.id, this.type, this.name});

  Specialized.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    return data;
  }
}
