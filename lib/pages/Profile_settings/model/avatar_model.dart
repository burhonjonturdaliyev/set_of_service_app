// ignore_for_file: camel_case_types

class avatar {
  bool? success;
  String? message;
  late String object;

  avatar({this.success, this.message, required this.object});

  avatar.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    object = json['object'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['object'] = object;
    return data;
  }
}
