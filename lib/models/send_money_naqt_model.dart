// ignore_for_file: non_constant_identifier_names, camel_case_types, avoid_web_libraries_in_flutter

import 'dart:html';

class Naqt_pul_model {
  String name;
  double kurs;
  String address;
  String phone_number;
  Url telegram;

  Naqt_pul_model(
      {required this.name,
      required this.kurs,
      required this.address,
      required this.phone_number,
      required this.telegram});
}
