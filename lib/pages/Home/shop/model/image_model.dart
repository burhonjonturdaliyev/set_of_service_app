// ignore_for_file: camel_case_types

class shop_image {
  bool? success;
  String? message;
  String? object;

  shop_image({this.success, this.message, this.object});

  shop_image.fromJson(Map<String, dynamic> json) {
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
