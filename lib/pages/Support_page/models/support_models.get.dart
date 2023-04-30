class Data {
  Data({
    required this.id,
    required this.createdAt,
    // this.createdBy,
    required this.updatedAt,
    // this.modifiedBy,
    required this.deleted,
    required this.userId,
    required this.status,
    required this.dialogs,
  });
  final int id;
  final String createdAt;
  // final Null createdBy;
  final String updatedAt;
  // final Null modifiedBy;
  final bool deleted;
  final int userId;
  final String status;
  final Dialogs dialogs;
}

class Dialogs {
  Dialogs({
    required this.createdAt,
    required this.userId,
    required this.fistName,
    required this.lastName,
    required this.accountType,
    required this.message,
  });
  final String createdAt;
  final int userId;
  final String fistName;
  final String lastName;
  final String accountType;
  final String message;
}
