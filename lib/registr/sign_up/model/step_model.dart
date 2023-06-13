// ignore_for_file: camel_case_types

class Step1_model {
  String? password;
  String? phoneNumber;

  Step1_model({required this.password, required this.phoneNumber});

  Step1_model.fromJson(Map<String, dynamic> json) {
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

class Step2_model {
  String? password;
  String? phoneNumber;
  String? smsCode;

  Step2_model(
      {required this.password,
      required this.phoneNumber,
      required this.smsCode});

  Step2_model.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    smsCode = json['smsCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['smsCode'] = smsCode;
    return data;
  }
}

class Step3_model {
  String? confirmPassword;
  String? dateOfBirth;
  String? firstName;
  String? genderType;
  String? lastName;
  String? password;
  String? phoneNumber;
  String? visitCountry;

  Step3_model(
      {required this.confirmPassword,
      required this.dateOfBirth,
      required this.firstName,
      required this.genderType,
      required this.lastName,
      required this.password,
      required this.phoneNumber,
      required this.visitCountry});

  Step3_model.fromJson(Map<String, dynamic> json) {
    confirmPassword = json['confirmPassword'];
    dateOfBirth = json['dateOfBirth'];

    firstName = json['firstName'];
    genderType = json['genderType'];
    lastName = json['lastName'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    visitCountry = json['visitCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confirmPassword'] = confirmPassword;
    data['dateOfBirth'] = dateOfBirth;

    data['firstName'] = firstName;
    data['genderType'] = genderType;
    data['lastName'] = lastName;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['visitCountry'] = visitCountry;
    return data;
  }
}
