// ignore_for_file: camel_case_types

class info_count {
  int? trend;
  int? embassy;
  int? uyaj;
  int? top;
  int? official;
  int? normal;
  int? others;
  int? fryQuestions;

  info_count(
      {required this.normal,
      required this.top,
      required this.trend,
      required this.official,
      required this.embassy,
      required this.uyaj,
      required this.fryQuestions,
      required this.others});

  info_count.fromJson(Map<String, dynamic> json) {
    normal = json['normal'];
    top = json['top'];
    trend = json['trend'];
    official = json['official'];
    embassy = json['embassy'];
    uyaj = json['uyaj'];
    fryQuestions = json['fryQuestions'];
    others = json['others'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['normal'] = normal;
    data['top'] = top;
    data['trend'] = trend;
    data['official'] = official;
    data['embassy'] = embassy;
    data['uyaj'] = uyaj;
    data['fryQuestions'] = fryQuestions;
    data['others'] = others;
    return data;
  }
}
