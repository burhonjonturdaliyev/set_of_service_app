// ignore_for_file: camel_case_types

class getting_info_user {
  bool? success;
  String? message;
  Object? object;

  getting_info_user({this.success, this.message, this.object});

  getting_info_user.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    object = json['object'] != null ? Object.fromJson(json['object']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (object != null) {
      data['object'] = object!.toJson();
    }
    return data;
  }
}

class Object {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? currentCountry;
  String? visitCountry;
  String? residentCardHashId;
  String? balanceChargeCode;
  double? balance;
  String? email;
  String? accountType;
  String? genderType;
  String? dateOfBirth;
  bool? verification;
  String? userHashId;

  Object(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.currentCountry,
      this.visitCountry,
      this.residentCardHashId,
      this.balanceChargeCode,
      this.balance,
      this.email,
      this.accountType,
      this.genderType,
      this.dateOfBirth,
      this.verification,
      this.userHashId});

  Object.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    currentCountry = json['currentCountry'];
    visitCountry = json['visitCountry'];
    residentCardHashId = json['residentCardHashId'];
    balanceChargeCode = json['balanceChargeCode'];
    balance = json['balance'];
    email = json['email'];
    accountType = json['accountType'];
    genderType = json['genderType'];
    dateOfBirth = json['dateOfBirth'];
    verification = json['verification'];
    userHashId = json['userHashId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['currentCountry'] = currentCountry;
    data['visitCountry'] = visitCountry;
    data['residentCardHashId'] = residentCardHashId;
    data['balanceChargeCode'] = balanceChargeCode;
    data['balance'] = balance;
    data['email'] = email;
    data['accountType'] = accountType;
    data['genderType'] = genderType;
    data['dateOfBirth'] = dateOfBirth;
    data['verification'] = verification;
    data['userHashId'] = userHashId;
    return data;
  }
}
