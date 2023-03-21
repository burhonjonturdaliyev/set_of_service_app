class comment_models {
  String id;
  bool check_id = false;
  String message;
  DateTime time;
  comment_models(
      {required this.id,
      required this.message,
      required this.check_id,
      required this.time});
}
