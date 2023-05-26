// ignore_for_file: no_leading_underscores_for_local_identifiers

class HomeModels {
  HomeModels({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.juridical,
    required this.serviceFee,
    required this.phoneNumber,
    required this.telegramUrl,
    required this.officeAddress,
    required this.active,
    this.serviceCategoryEntity,
    required this.serviceCategoryId,
    required this.businessProfileId,
    required this.totalStarts,
    required this.totalViews,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String title;
  late final String subTitle;
  late final bool juridical;
  late final String serviceFee;
  late final String phoneNumber;
  late final String telegramUrl;
  late final String officeAddress;
  late final bool active;
  // ignore: prefer_void_to_null
  late final Null serviceCategoryEntity;
  late final int serviceCategoryId;
  late final int businessProfileId;
  late final double totalStarts;
  late final int totalViews;
  late final DateTime createdAt;
  late final DateTime updatedAt;

  HomeModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    juridical = json['juridical'];
    serviceFee = json['serviceFee'];
    phoneNumber = json['phoneNumber'];
    telegramUrl = json['telegramUrl'];
    officeAddress = json['officeAddress'];
    active = json['active'];
    serviceCategoryEntity = null;
    serviceCategoryId = json['serviceCategoryId'];
    businessProfileId = json['businessProfileId'];
    totalStarts = json['totalStarts'];
    totalViews = json['totalViews'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['subTitle'] = subTitle;
    _data['juridical'] = juridical;
    _data['serviceFee'] = serviceFee;
    _data['phoneNumber'] = phoneNumber;
    _data['telegramUrl'] = telegramUrl;
    _data['officeAddress'] = officeAddress;
    _data['active'] = active;
    _data['serviceCategoryEntity'] = serviceCategoryEntity;
    _data['serviceCategoryId'] = serviceCategoryId;
    _data['businessProfileId'] = businessProfileId;
    _data['totalStarts'] = totalStarts;
    _data['totalViews'] = totalViews;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
