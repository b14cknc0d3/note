class Note {
  int? id;
  String? title;
  String? note;
  String? createAt;

  Note({this.id, this.title, this.note, this.createAt});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    note = json['note'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['id'] = id;

    data['title'] = title;
    data['note'] = note;
    data['createAt'] = createAt;
    return data;
  }

  @override
  String toString() {
    return title.toString();
  }
}
