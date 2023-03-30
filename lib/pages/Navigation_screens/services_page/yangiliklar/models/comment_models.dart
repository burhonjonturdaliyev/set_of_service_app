class comment_models {
  String name;
  bool check_id = false;
  String message;
  DateTime time;
  comment_models(
      {required this.name,
      required this.message,
      required this.check_id,
      required this.time});
}
