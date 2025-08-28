class FeaturedSlider {
  String? message;
  List<Data>? data;

  FeaturedSlider({this.message, this.data});

  FeaturedSlider.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? subtitle;
  String? imageUrl;
  String? redirectUrl;
  int? displayOrder;
  bool? isActive;
  String? description;
  String? eventDate;
  String? location;
  String? buttonText;
  String? alias;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.subtitle,
        this.imageUrl,
        this.redirectUrl,
        this.displayOrder,
        this.isActive,
        this.description,
        this.eventDate,
        this.location,
        this.buttonText,
        this.alias,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    imageUrl = json['image_url'];
    redirectUrl = json['redirect_url'];
    displayOrder = json['display_order'];
    isActive = json['is_active'];
    description = json['description'];
    eventDate = json['event_date'];
    location = json['location'];
    buttonText = json['button_text'];
    alias = json['alias'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['image_url'] = this.imageUrl;
    data['redirect_url'] = this.redirectUrl;
    data['display_order'] = this.displayOrder;
    data['is_active'] = this.isActive;
    data['description'] = this.description;
    data['event_date'] = this.eventDate;
    data['location'] = this.location;
    data['button_text'] = this.buttonText;
    data['alias'] = this.alias;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
