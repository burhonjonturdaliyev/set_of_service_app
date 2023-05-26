// ignore_for_file: camel_case_types

class chat_models {
  String message;
  String username;
  int userId;
  bool edited;
  DateTime? createdAt;
  chat_models(
      {required this.message,
      required this.username,
      required this.userId,
      required this.edited,
      required this.createdAt});
}
