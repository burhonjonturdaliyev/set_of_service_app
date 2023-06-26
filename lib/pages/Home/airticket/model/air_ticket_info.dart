// ignore_for_file: camel_case_types

class air_ticket_info {
  String? airClass;
  String? from;
  int? passenger;
  String? returnDate;
  String? toGoDate;
  int? userId;
  String? whereTo;

  air_ticket_info(
      {required this.airClass,
      required this.from,
      required this.passenger,
      required this.returnDate,
      required this.toGoDate,
      required this.userId,
      required this.whereTo});

  air_ticket_info.fromJson(Map<String, dynamic> json) {
    airClass = json['airClass'];
    from = json['from'];
    passenger = json['passenger'];
    returnDate = json['returnDate'];
    toGoDate = json['toGoDate'];
    userId = json['userId'];
    whereTo = json['whereTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airClass'] = airClass;
    data['from'] = from;
    data['passenger'] = passenger;
    data['returnDate'] = returnDate;
    data['toGoDate'] = toGoDate;
    data['userId'] = userId;
    data['whereTo'] = whereTo;
    return data;
  }
}
