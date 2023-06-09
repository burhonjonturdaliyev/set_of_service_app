// ignore_for_file: camel_case_types

class login_model {
  String? password;
  String? phoneNumber;

  login_model({required this.password, required this.phoneNumber});

  login_model.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
