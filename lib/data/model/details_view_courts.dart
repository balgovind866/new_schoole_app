class DetailsCourts {
  bool? success;
  Data? data;

  DetailsCourts({this.success, this.data});

  DetailsCourts.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? address;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? latitude;
  String? longitude;
  String? courtType;
  String? imageUrl;
  String? facilities;
  String? alias;
  String? heading;
  String? subHeading;
  String? content;
  String? shortDescription;
  bool? isActive;
  bool? isFeatured;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.address,
        this.city,
        this.state,
        this.country,
        this.postalCode,
        this.latitude,
        this.longitude,
        this.courtType,
        this.imageUrl,
        this.facilities,
        this.alias,
        this.heading,
        this.subHeading,
        this.content,
        this.shortDescription,
        this.isActive,
        this.isFeatured,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    courtType = json['court_type'];
    imageUrl = json['image_url'];
    facilities = json['facilities'];
    alias = json['alias'];
    heading = json['heading'];
    subHeading = json['sub_heading'];
    content = json['content'];
    shortDescription = json['short_description'];
    isActive = json['is_active'];
    isFeatured = json['is_featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postal_code'] = this.postalCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['court_type'] = this.courtType;
    data['image_url'] = this.imageUrl;
    data['facilities'] = this.facilities;
    data['alias'] = this.alias;
    data['heading'] = this.heading;
    data['sub_heading'] = this.subHeading;
    data['content'] = this.content;
    data['short_description'] = this.shortDescription;
    data['is_active'] = this.isActive;
    data['is_featured'] = this.isFeatured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}