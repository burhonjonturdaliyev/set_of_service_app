class Data {
  Data({
    required this.dialogs,
  });

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

class Id {
  int? id;
  Id({this.id});
}
