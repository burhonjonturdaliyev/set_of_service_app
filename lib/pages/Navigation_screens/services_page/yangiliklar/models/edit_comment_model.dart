// ignore_for_file: camel_case_types

class edit_comment_model {
  int? id;
  String? message;
  int? newsId;
  int? userId;

  edit_comment_model(
      {required this.id,
      required this.message,
      required this.newsId,
      required this.userId});

  edit_comment_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    newsId = json['newsId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['newsId'] = newsId;
    data['userId'] = userId;
    return data;
  }
}
