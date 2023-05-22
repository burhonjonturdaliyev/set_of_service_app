// ignore_for_file: file_names, camel_case_types

class newCommentModels {
  String name;
  int id;
  String message;
  String createdAt;

  newCommentModels(
      {required this.id,
      required this.createdAt,
      required this.message,
      required this.name});
}

class putMessageComment {
  int? countryGlobalInfoId;
  String? message;
  int? userId;

  putMessageComment(
      {required this.countryGlobalInfoId,
      required this.message,
      required this.userId});

  putMessageComment.fromJson(Map<String, dynamic> json) {
    countryGlobalInfoId = json['countryGlobalInfoId'];
    message = json['message'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryGlobalInfoId'] = countryGlobalInfoId;
    data['message'] = message;
    data['userId'] = userId;
    return data;
  }
}
