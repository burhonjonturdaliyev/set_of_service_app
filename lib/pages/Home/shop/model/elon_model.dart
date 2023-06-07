// ignore_for_file: camel_case_types

class elon_model {
  String? address;
  int? businessProfileId;
  String? createdAt;
  bool? delivered;
  String? description;
  int? id;
  String? mobileNumber;
  List<int>? objectPhotos;
  String? phoneNumber;
  String? shopType;
  int? starts;
  String? telegramUrl;
  String? title;
  String? updatedAt;
  int? viewsCount;

  elon_model(
      {required this.address,
      required this.businessProfileId,
      required this.createdAt,
      required this.delivered,
      required this.description,
      required this.id,
      required this.mobileNumber,
      required this.objectPhotos,
      required this.phoneNumber,
      required this.shopType,
      required this.starts,
      required this.telegramUrl,
      required this.title,
      required this.updatedAt,
      required this.viewsCount});

  elon_model.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    businessProfileId = json['businessProfileId'];
    createdAt = json['createdAt'];
    delivered = json['delivered'];
    description = json['description'];
    id = json['id'];
    mobileNumber = json['mobileNumber'];
    objectPhotos = json['objectPhotos'].cast<int>();
    phoneNumber = json['phoneNumber'];
    shopType = json['shopType'];
    starts = json['starts'];
    telegramUrl = json['telegramUrl'];
    title = json['title'];
    updatedAt = json['updatedAt'];
    viewsCount = json['viewsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['businessProfileId'] = businessProfileId;
    data['createdAt'] = createdAt;
    data['delivered'] = delivered;
    data['description'] = description;
    data['id'] = id;
    data['mobileNumber'] = mobileNumber;
    data['objectPhotos'] = objectPhotos;
    data['phoneNumber'] = phoneNumber;
    data['shopType'] = shopType;
    data['starts'] = starts;
    data['telegramUrl'] = telegramUrl;
    data['title'] = title;
    data['updatedAt'] = updatedAt;
    data['viewsCount'] = viewsCount;
    return data;
  }
}
