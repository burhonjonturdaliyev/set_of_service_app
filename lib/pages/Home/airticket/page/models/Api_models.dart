class Api_models {
  int id;
  String? createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  String? fromTo;
  String? whereTo;
  DateTime toGoDate;
  DateTime returnDate;
  String? airClass;
  int passenger;
  int userId;

  Api_models({
    required this.id,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.fromTo,
    required this.whereTo,
    required this.toGoDate,
    required this.returnDate,
    required this.airClass,
    required this.passenger,
    required this.userId,
  });
}
