// ignore_for_file: camel_case_types

class elon_model {
  String? address;
  bool? delivered;
  String? description;
  int? id;
  String? mobileNumber;
  String? phoneNumber;
  String? shopType;
  String? telegramUrl;
  String? title;

  elon_model(
      {required this.address,
      required this.delivered,
      required this.description,
      required this.id,
      required this.mobileNumber,
      required this.phoneNumber,
      required this.shopType,
      required this.telegramUrl,
      required this.title});

  elon_model.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    delivered = json['delivered'];
    description = json['description'];
    id = json['id'];
    mobileNumber = json['mobileNumber'];
    phoneNumber = json['phoneNumber'];
    shopType = json['shopType'];
    telegramUrl = json['telegramUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['delivered'] = delivered;
    data['description'] = description;
    data['id'] = id;
    data['mobileNumber'] = mobileNumber;
    data['phoneNumber'] = phoneNumber;
    data['shopType'] = shopType;
    data['telegramUrl'] = telegramUrl;
    data['title'] = title;
    return data;
  }
}
