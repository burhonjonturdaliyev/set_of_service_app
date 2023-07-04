// ignore_for_file: camel_case_types

class profel_edit {
  String? currentCountry;
  String? dateOfBirth;
  String? email;
  String? firstName;
  String? genderType;
  int? id;
  String? lastName;
  String? userHashId;
  String? visitCountry;

  profel_edit(
      {required this.currentCountry,
      required this.dateOfBirth,
      required this.email,
      required this.firstName,
      required this.genderType,
      required this.id,
      required this.lastName,
      required this.userHashId,
      required this.visitCountry});

  profel_edit.fromJson(Map<String, dynamic> json) {
    currentCountry = json['currentCountry'];
    dateOfBirth = json['dateOfBirth'];
    email = json['email'];
    firstName = json['firstName'];
    genderType = json['genderType'];
    id = json['id'];
    lastName = json['lastName'];
    userHashId = json['userHashId'];
    visitCountry = json['visitCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentCountry'] = currentCountry;
    data['dateOfBirth'] = dateOfBirth;
    data['email'] = email;
    data['firstName'] = firstName;
    data['genderType'] = genderType;
    data['id'] = id;
    data['lastName'] = lastName;
    data['userHashId'] = userHashId;
    data['visitCountry'] = visitCountry;
    return data;
  }
}
