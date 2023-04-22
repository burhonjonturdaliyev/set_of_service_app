class support_get {
  int id;
  DateTime createdAt;
  int userId;
  final Dialogs dialogs;
  support_get(
      {required this.id,
      required this.createdAt,
      required this.userId,
      required this.dialogs});
}

class Dialogs {
  int userId;
  String accountType;
  String message;
  Dialogs(
      {required this.userId, required this.message, required this.accountType});
}
