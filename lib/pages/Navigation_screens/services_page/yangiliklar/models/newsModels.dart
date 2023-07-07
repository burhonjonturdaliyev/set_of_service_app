// ignore_for_file: camel_case_types, file_names

class CatagoryModels {
  String name;
  String type;

  CatagoryModels({
    required this.name,
    required this.type,
  });
}

class news_model {
  int? id;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  bool? deleted;
  String? title;
  String? description;
  String? newsType;
  String? photo;

  news_model(
      {required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.deleted,
      required this.title,
      required this.description,
      required this.newsType,
      required this.photo});

  news_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    deleted = json['deleted'];
    title = json['title'];
    description = json['description'];
    newsType = json['newsType'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['updatedAt'] = updatedAt;
    data['deleted'] = deleted;
    data['title'] = title;
    data['description'] = description;
    data['newsType'] = newsType;
    data['photo'] = photo;
    return data;
  }
}
