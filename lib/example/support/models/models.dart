class ExampleSupport {
  int? id;
  String? createdAt;
  int? userId;
  String? status;
  Dialogs dialogs;

  ExampleSupport(
      {required this.id,
      required this.createdAt,
      required this.userId,
      required this.status,
      required this.dialogs});
}

class Dialogs {
  String? createdAt;
  int? userId;
  String? fistName;
  String? lastName;
  String? accountType;
  String? message;

  Dialogs(
      {this.createdAt,
      this.userId,
      this.fistName,
      this.lastName,
      this.accountType,
      this.message});
}
