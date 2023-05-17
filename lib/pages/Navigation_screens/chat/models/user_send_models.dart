// ignore_for_file: camel_case_types

class user_send {
  String message;
  int userId;
  user_send({required this.message, required this.userId});
  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "userId": userId,
    };
  }
}
