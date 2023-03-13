// ignore_for_file: camel_case_types, non_constant_identifier_names

class history_money_model {
  String name;
  int komissiya;
  double kurs;
  String manba;
  double summa;
  double convert_sum;
  bool holat;
  String sabab;
  DateTime time;

  history_money_model(
      {required this.manba,
      required this.summa,
      required this.holat,
      required this.sabab,
      required this.time,
      required this.convert_sum,
      required this.komissiya,
      required this.kurs,
      required this.name});
}
