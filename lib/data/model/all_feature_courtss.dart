class AllFeatureCourt {
  bool? success;
  String? message;
  Pagination? pagination;
  List<AllFeatureData>? data;

  AllFeatureCourt({this.success, this.message, this.pagination, this.data});

  AllFeatureCourt.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <AllFeatureData>[];
      json['data'].forEach((v) {
        data!.add(new AllFeatureData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? page;
  int? limit;
  int? totalPages;
  int? totalItems;
  bool? hasNextPage;
  bool? hasPrevPage;

  Pagination(
      {this.page,
        this.limit,
        this.totalPages,
        this.totalItems,
        this.hasNextPage,
        this.hasPrevPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    hasNextPage = json['hasNextPage'];
    hasPrevPage = json['hasPrevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['totalPages'] = this.totalPages;
    data['totalItems'] = this.totalItems;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPrevPage'] = this.hasPrevPage;
    return data;
  }
}

class AllFeatureData {
  int? id;
  String? name;
  String? alias;
  String? heading;
  String? subHeading;
  bool? isFeatured;
  bool? isActive;
  String? imageUrl;

  AllFeatureData(
      {this.id,
        this.name,
        this.alias,
        this.heading,
        this.subHeading,
        this.isFeatured,
        this.isActive,
        this.imageUrl});
  AllFeatureData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    heading = json['heading'];
    subHeading = json['sub_heading'];
    isFeatured = json['is_featured'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['heading'] = this.heading;
    data['sub_heading'] = this.subHeading;
    data['is_featured'] = this.isFeatured;
    data['is_active'] = this.isActive;
    data['image_url'] = this.imageUrl;
    return data;
  }
}