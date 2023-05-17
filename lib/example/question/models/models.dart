class Dialog {
  final DateTime createdAt;
  final int userId;
  final String firstName;
  final String lastName;
  final String accountType;
  final String message;

  Dialog({
    required this.createdAt,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.accountType,
    required this.message,
  });

  factory Dialog.fromJson(Map<String, dynamic> json) {
    return Dialog(
      createdAt: DateTime.parse(json['createdAt']),
      userId: json['userId'],
      firstName: json['fistName'],
      lastName: json['lastName'],
      accountType: json['accountType'],
      message: json['message'],
    );
  }
}

class Data {
  final int id;
  final DateTime createdAt;
  final int createdBy;
  final DateTime updatedAt;
  final dynamic modifiedBy;
  final bool deleted;
  final int userId;
  final String status;
  final List<Dialog> dialogs;

  Data({
    required this.id,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.modifiedBy,
    required this.deleted,
    required this.userId,
    required this.status,
    required this.dialogs,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      createdBy: json['createdBy'],
      updatedAt: DateTime.parse(json['updatedAt']),
      modifiedBy: json['modifiedBy'],
      deleted: json['deleted'],
      userId: json['userId'],
      status: json['status'],
      dialogs:
          List<Dialog>.from(json['dialogs'].map((x) => Dialog.fromJson(x))),
    );
  }
}
