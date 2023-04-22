class Support_models_send {
  int id;
  int userId;
  final Dialogs dialogs;
  Support_models_send(
      {required this.id, required this.userId, required this.dialogs});
  Map<String, dynamic> toJson() {
    return {"id": id, "userId": userId, "dialogs": dialogs};
  }
}

class Dialogs {
  int userId;
  String message;
  Dialogs({required this.userId, required this.message});
  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "userId": userId,
    };
  }
}
