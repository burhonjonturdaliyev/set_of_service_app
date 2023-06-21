// ignore_for_file: camel_case_types

class nofoods_model {
  nofoods_model({
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
  late final void serviceCategoryEntity;
  late final int serviceCategoryId;
  late final int businessProfileId;
  late final double totalStarts;
  late final int totalViews;
  late final DateTime createdAt;
  late final DateTime updatedAt;
}
