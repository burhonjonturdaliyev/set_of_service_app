// ignore_for_file: camel_case_types

class other_services_model {
  int? id;
  String? title;
  String? subTitle;
  bool? juridical;
  String? serviceFee;
  String? phoneNumber;
  String? telegramUrl;
  String? officeAddress;
  bool? active;
  int? serviceCategoryEntityId;
  int? serviceCategoryId;
  int? businessProfileId;
  double? totalStarts;
  int? totalViews;
  String? createdAt;
  String? updatedAt;

  other_services_model(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.juridical,
      required this.serviceFee,
      required this.phoneNumber,
      required this.telegramUrl,
      required this.officeAddress,
      required this.active,
      required this.serviceCategoryEntityId,
      required this.serviceCategoryId,
      required this.businessProfileId,
      required this.totalStarts,
      required this.totalViews,
      required this.createdAt,
      required this.updatedAt});

  other_services_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    juridical = json['juridical'];
    serviceFee = json['serviceFee'];
    phoneNumber = json['phoneNumber'];
    telegramUrl = json['telegramUrl'];
    officeAddress = json['officeAddress'];
    active = json['active'];
    serviceCategoryEntityId = json['serviceCategoryEntityId'];
    serviceCategoryId = json['serviceCategoryId'];
    businessProfileId = json['businessProfileId'];
    totalStarts = json['totalStarts'];
    totalViews = json['totalViews'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['juridical'] = juridical;
    data['serviceFee'] = serviceFee;
    data['phoneNumber'] = phoneNumber;
    data['telegramUrl'] = telegramUrl;
    data['officeAddress'] = officeAddress;
    data['active'] = active;
    data['serviceCategoryEntityId'] = serviceCategoryEntityId;
    data['serviceCategoryId'] = serviceCategoryId;
    data['businessProfileId'] = businessProfileId;
    data['totalStarts'] = totalStarts;
    data['totalViews'] = totalViews;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
