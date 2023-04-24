class support_get {
  int? id;
  DateTime? createdAt;
  DateTime? createdBy;
  DateTime? updatedAt;
  String? modifiedBy;
  bool? deleted;
  int? userId;
  String? status;
  Dialogs? dialogs;
  support_get(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.deleted,
      required this.userId,
      required this.status,
      required this.dialogs});
}

class Dialogs {
  DateTime? createdAt;
  String? userId;
  String? fistName;
  String? lastName;
  String? accountType;
  String? message;

  Dialogs(
      {required this.createdAt,
      required this.userId,
      required this.fistName,
      required this.lastName,
      required this.accountType,
      required this.message});
}
