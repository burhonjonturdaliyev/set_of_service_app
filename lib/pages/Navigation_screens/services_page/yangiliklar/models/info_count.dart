class NewsModel {
  bool? success;
  String? message;
  NewsObject? object;

  NewsModel({this.success, this.message, this.object});

  NewsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    object =
        json['object'] != null ? NewsObject.fromJson(json['object']) : null;
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

class NewsObject {
  int? oTHERS;
  int? tOP;
  int? oFFICAL;
  int? uZBEMBASSY;
  int? uYAJ;
  int? tREND;
  int? nORMAL;
  int? fREQUENTLYQUESTIONS;

  NewsObject(
      {this.oTHERS,
      this.tOP,
      this.oFFICAL,
      this.uZBEMBASSY,
      this.uYAJ,
      this.tREND,
      this.nORMAL,
      this.fREQUENTLYQUESTIONS});

  NewsObject.fromJson(Map<String, dynamic> json) {
    oTHERS = json['OTHERS'];
    tOP = json['TOP'];
    oFFICAL = json['OFFICAL'];
    uZBEMBASSY = json['UZB_EMBASSY'];
    uYAJ = json['UYAJ'];
    tREND = json['TREND'];
    nORMAL = json['NORMAL'];
    fREQUENTLYQUESTIONS = json['FREQUENTLY_QUESTIONS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OTHERS'] = oTHERS;
    data['TOP'] = tOP;
    data['OFFICAL'] = oFFICAL;
    data['UZB_EMBASSY'] = uZBEMBASSY;
    data['UYAJ'] = uYAJ;
    data['TREND'] = tREND;
    data['NORMAL'] = nORMAL;
    data['FREQUENTLY_QUESTIONS'] = fREQUENTLYQUESTIONS;
    return data;
  }
}
