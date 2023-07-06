// ignore_for_file: camel_case_types

class shop_no_foods_model {
  int? id;
  String? title;
  String? description;
  bool? delivered;
  String? address;
  String? telegramUrl;
  String? phoneNumber;
  String? mobileNumber;
  String? shopType;
  List<dynamic>? objectPhotos;
  String? createdAt;
  String? updatedAt;
  int? viewsCount;
  double? starts;
  int? businessProfileId;
  int? userId;

  shop_no_foods_model(
      {required this.id,
      required this.title,
      required this.description,
      required this.delivered,
      required this.address,
      required this.telegramUrl,
      required this.phoneNumber,
      required this.mobileNumber,
      required this.shopType,
      required this.objectPhotos,
      required this.createdAt,
      required this.updatedAt,
      required this.viewsCount,
      required this.starts,
      required this.businessProfileId,
      required this.userId});

  shop_no_foods_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    delivered = json['delivered'];
    address = json['address'];
    telegramUrl = json['telegramUrl'];
    phoneNumber = json['phoneNumber'];
    mobileNumber = json['mobileNumber'];
    shopType = json['shopType'];
    objectPhotos = json['objectPhotos'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    viewsCount = json['viewsCount'];
    starts = json['starts'];
    businessProfileId = json['businessProfileId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['delivered'] = delivered;
    data['address'] = address;
    data['telegramUrl'] = telegramUrl;
    data['phoneNumber'] = phoneNumber;
    data['mobileNumber'] = mobileNumber;
    data['shopType'] = shopType;
    data['objectPhotos'] = objectPhotos;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['viewsCount'] = viewsCount;
    data['starts'] = starts;
    data['businessProfileId'] = businessProfileId;
    data['userId'] = userId;
    return data;
  }
}
