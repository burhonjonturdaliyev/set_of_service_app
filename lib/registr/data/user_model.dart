// ignore_for_file: camel_case_types, unnecessary_question_mark, prefer_void_to_null

class user_model {
  User? user;

  user_model({this.user});

  user_model.fromJson(Map<String, dynamic> json) {
    user = json['user: '] != null ? User.fromJson(json['user: ']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user: '] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  Null? confirmPassword;
  String? password;
  String? currentCountry;
  String? visitCountry;
  Null? residentCardId;
  String? balanceChargeCode;
  double? balance;
  Null? email;
  String? accountType;
  String? genderType;
  String? dateOfBirth;
  Null? avatarPhoto;
  Null? deviceId;
  bool? verification;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.confirmPassword,
      this.password,
      this.currentCountry,
      this.visitCountry,
      this.residentCardId,
      this.balanceChargeCode,
      this.balance,
      this.email,
      this.accountType,
      this.genderType,
      this.dateOfBirth,
      this.avatarPhoto,
      this.deviceId,
      this.verification});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    confirmPassword = json['confirmPassword'];
    password = json['password'];
    currentCountry = json['currentCountry'];
    visitCountry = json['visitCountry'];
    residentCardId = json['residentCardId'];
    balanceChargeCode = json['balanceChargeCode'];
    balance = json['balance'];
    email = json['email'];
    accountType = json['accountType'];
    genderType = json['genderType'];
    dateOfBirth = json['dateOfBirth'];
    avatarPhoto = json['avatarPhoto'];
    deviceId = json['deviceId'];
    verification = json['verification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['confirmPassword'] = confirmPassword;
    data['password'] = password;
    data['currentCountry'] = currentCountry;
    data['visitCountry'] = visitCountry;
    data['residentCardId'] = residentCardId;
    data['balanceChargeCode'] = balanceChargeCode;
    data['balance'] = balance;
    data['email'] = email;
    data['accountType'] = accountType;
    data['genderType'] = genderType;
    data['dateOfBirth'] = dateOfBirth;
    data['avatarPhoto'] = avatarPhoto;
    data['deviceId'] = deviceId;
    data['verification'] = verification;
    return data;
  }
}
