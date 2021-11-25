class Note {
  int? id;
  String? title;
  String? note;
  String? createAt;
  String? updatedAt; //for Frequently used in Drawer
  String? folderName; //for Folder in Drawer
  int? isInTrash; //for Recycle bin in Drawer
  int? favourite;

  Note(
      {this.id,
      this.title,
      this.note,
      this.createAt,
      this.updatedAt,
      this.folderName,
      this.isInTrash,
      this.favourite});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    note = json['note'];
    createAt = json['createAt'];
    updatedAt = json['updatedAt'];
    folderName = json['folderName'];
    isInTrash = json['isInTrash'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['id'] = id;

    data['title'] = title;
    data['note'] = note;
    data['createAt'] = createAt;
    data['updatedAt'] = updatedAt;
    data['folderName'] = folderName;
    data['isInTrash'] = isInTrash;
    data['favourite'] = favourite;
    return data;
  }

  @override
  String toString() {
    return title.toString();
  }
}
