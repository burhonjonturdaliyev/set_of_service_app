// ignore_for_file: camel_case_types, non_constant_identifier_names

class New_currency {
  final String title;
  final String code;
  final String cb_price;
  final String nbu_buy_price;
  final String nbu_cell_price;

  final DateTime date;

  New_currency({
    required this.title,
    required this.code,
    required this.cb_price,
    required this.nbu_buy_price,
    required this.nbu_cell_price,
    required this.date,
  });
}
