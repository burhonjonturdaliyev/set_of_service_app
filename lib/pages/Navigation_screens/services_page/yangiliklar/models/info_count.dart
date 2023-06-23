// ignore_for_file: camel_case_types

class info_count {
  int? normal;
  int? top;
  int? trend;
  int? official;
  int? embassy;
  int? uyaj;
  int? fryQuestions;
  int? others;

  info_count(
      {this.normal,
      this.top,
      this.trend,
      this.official,
      this.embassy,
      this.uyaj,
      this.fryQuestions,
      this.others});

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
