// ignore_for_file: file_names, camel_case_types
class getting_komment_model {
  int? id;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  bool? deleted;
  String? userName;
  String? message;
  int? newsId;
  bool? edited;

  getting_komment_model(
      {required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.deleted,
      required this.userName,
      required this.message,
      required this.newsId,
      required this.edited});

  getting_komment_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    deleted = json['deleted'];
    userName = json['userName'];
    message = json['message'];
    newsId = json['newsId'];
    edited = json['edited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['updatedAt'] = updatedAt;
    data['deleted'] = deleted;
    data['userName'] = userName;
    data['message'] = message;
    data['newsId'] = newsId;
    data['edited'] = edited;
    return data;
  }
}

class comment_adding_model {
  String? message;
  int? newsId;
  int? userId;

  comment_adding_model(
      {required this.message, required this.newsId, required this.userId});

  comment_adding_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    newsId = json['newsId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['newsId'] = newsId;
    data['userId'] = userId;
    return data;
  }
}
