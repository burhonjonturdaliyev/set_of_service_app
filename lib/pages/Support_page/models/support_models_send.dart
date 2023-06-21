class PostSupport {
  Dialogsa? dialogsa;
  int? id;
  int? userId;

  PostSupport({required this.dialogsa, this.id, required this.userId});

  PostSupport.fromJson(Map<String, dynamic> json) {
    dialogsa =
        json['dialogs'] != null ? Dialogsa.fromJson(json['dialogs']) : null;
    id = json['id'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dialogsa != null) {
      data['dialogs'] = dialogsa!.toJson();
    }
    data['id'] = id;
    data['userId'] = userId;
    return data;
  }
}

class Dialogsa {
  String? message;
  int? userId;

  Dialogsa({this.message, this.userId});

  Dialogsa.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['message'] = message;
    data['userId'] = userId;
    return data;
  }
}
