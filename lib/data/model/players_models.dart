class PlayerListModel {
  String? message;
  int? page;
  int? limit;
  List<Data>? data;

  PlayerListModel({this.message, this.page, this.limit, this.data});

  PlayerListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    page = json['page'];
    limit = json['limit'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['page'] = this.page;
    data['limit'] = this.limit;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? playerId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? skillLevel;
  String? profileImage;
  String? dateJoined;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.playerId,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.skillLevel,
        this.profileImage,
        this.dateJoined,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    skillLevel = json['skill_level'];
    profileImage = json['profile_image'];
    dateJoined = json['date_joined'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_id'] = this.playerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['skill_level'] = this.skillLevel;
    data['profile_image'] = this.profileImage;
    data['date_joined'] = this.dateJoined;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}