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
  String? address;
  String? phone;
  String? email;
  String? baseUrl;
  Null? logoPath;
  Null? bannerPath;
  Null? paymentLink;
  String? principalName;
  Null? establishedYear;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<Sessions>? sessions;
  List<Classes>? classes;

  Data(
      {this.id,
        this.code,
        this.name,
        this.address,
        this.phone,
        this.email,
        this.baseUrl,
        this.logoPath,
        this.bannerPath,
        this.paymentLink,
        this.principalName,
        this.establishedYear,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.sessions,
        this.classes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    baseUrl = json['baseUrl'];
    logoPath = json['logoPath'];
    bannerPath = json['bannerPath'];
    paymentLink = json['paymentLink'];
    principalName = json['principalName'];
    establishedYear = json['establishedYear'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['baseUrl'] = this.baseUrl;
    data['logoPath'] = this.logoPath;
    data['bannerPath'] = this.bannerPath;
    data['paymentLink'] = this.paymentLink;
    data['principalName'] = this.principalName;
    data['establishedYear'] = this.establishedYear;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  int? id;
  String? schoolCode;
  String? name;
  Null? start;
  Null? enddate;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Sessions(
      {this.id,
        this.schoolCode,
        this.name,
        this.start,
        this.enddate,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolCode = json['schoolCode'];
    name = json['name'];
    start = json['start'];
    enddate = json['enddate'];
    isActive = json['isActive'];
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
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Classes {
  int? id;
  String? schoolCode;
  String? name;
  int? level;
  String? description;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<Sections>? sections;

  Classes(
      {this.id,
        this.schoolCode,
        this.name,
        this.level,
        this.description,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.sections});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolCode = json['schoolCode'];
    name = json['name'];
    level = json['level'];
    description = json['description'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schoolCode'] = this.schoolCode;
    data['name'] = this.name;
    data['level'] = this.level;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sections {
  int? id;
  String? schoolCode;
  int? classId;
  String? name;
  int? capacity;
  int? classTeacherId;
  String? room;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Sections(
      {this.id,
        this.schoolCode,
        this.classId,
        this.name,
        this.capacity,
        this.classTeacherId,
        this.room,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolCode = json['schoolCode'];
    classId = json['classId'];
    name = json['name'];
    capacity = json['capacity'];
    classTeacherId = json['classTeacherId'];
    room = json['room'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schoolCode'] = this.schoolCode;
    data['classId'] = this.classId;
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    data['classTeacherId'] = this.classTeacherId;
    data['room'] = this.room;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
