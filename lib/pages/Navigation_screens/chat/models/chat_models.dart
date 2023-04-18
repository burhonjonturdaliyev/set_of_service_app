class chat_models {
  int id;
  String message;
  String username;
  int userId;
  bool edited;
  chat_models(
      {required this.id,
      required this.message,
      required this.username,
      required this.userId,
      required this.edited});
}
