class FeaturedCourts {
  bool? success;
  List<CourtsData>? data;

  FeaturedCourts({this.success, this.data});

  FeaturedCourts.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CourtsData>[];
      json['data'].forEach((v) {
        data!.add(new CourtsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourtsData {
  int? id;
  String? name;
  String? city;
  String? courtType;
  String? imageUrl;
  var distanceKm;

  CourtsData(
      {this.id,
        this.name,
        this.city,
        this.courtType,
        this.imageUrl,
        this.distanceKm});

  CourtsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    courtType = json['court_type'];
    imageUrl = json['image_url'];
    distanceKm = json['distance_km'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['court_type'] = this.courtType;
    data['image_url'] = this.imageUrl;
    data['distance_km'] = this.distanceKm;
    return data;
  }
}
