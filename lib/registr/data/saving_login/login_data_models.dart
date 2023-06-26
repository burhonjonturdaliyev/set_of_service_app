// ignore_for_file: camel_case_types

class login_save {
  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String currentCountry;
  String visitCountry;
  int balance;
  String accountType;
  String genderType;
  String dateOfBirth;
  bool verification;

  login_save(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.currentCountry,
      required this.visitCountry,
      required this.balance,
      required this.accountType,
      required this.genderType,
      required this.dateOfBirth,
      required this.verification});
}
