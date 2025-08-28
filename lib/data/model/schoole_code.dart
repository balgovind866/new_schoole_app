class SchooleCodeVerifation {
  bool? success;
  Data? data;

  SchooleCodeVerifation({this.success, this.data});

  SchooleCodeVerifation.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? code;
  String? name;
  String? baseUrl;
  String? logoPath;
  String? bannerPath;
  String? paymentLink;
  String? createdAt;
  String? updatedAt;
  List<Sessions>? sessions;

  Data(
      {this.id,
        this.code,
        this.name,
        this.baseUrl,
        this.logoPath,
        this.bannerPath,
        this.paymentLink,
        this.createdAt,
        this.updatedAt,
        this.sessions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    baseUrl = json['baseUrl'];
    logoPath = json['logoPath'];
    bannerPath = json['bannerPath'];
    paymentLink = json['paymentLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['baseUrl'] = this.baseUrl;
    data['logoPath'] = this.logoPath;
    data['bannerPath'] = this.bannerPath;
    data['paymentLink'] = this.paymentLink;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  int? id;
  String? schoolCode;
  String? name;
  String? start;
  String? enddate;
  bool? isactive;
  String? createdAt;
  String? updatedAt;

  Sessions(
      {this.id,
        this.schoolCode,
        this.name,
        this.start,
        this.enddate,
        this.isactive,
        this.createdAt,
        this.updatedAt});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolCode = json['schoolCode'];
    name = json['name'];
    start = json['start'];
    enddate = json['enddate'];
    isactive = json['isactive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schoolCode'] = this.schoolCode;
    data['name'] = this.name;
    data['start'] = this.start;
    data['enddate'] = this.enddate;
    data['isactive'] = this.isactive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
