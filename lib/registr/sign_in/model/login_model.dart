// ignore_for_file: camel_case_types

class login_model {
  String? password;
  String? phoneNumber;
  String? macAddress;

  login_model(
      {required this.password,
      required this.phoneNumber,
      required this.macAddress});

  login_model.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    macAddress = json['macAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['macAddress'] = macAddress;
    return data;
  }
}
