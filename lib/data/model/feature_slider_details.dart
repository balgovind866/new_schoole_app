class FeatureSliderDetails {
  bool? success;
  SliderData? data;

  FeatureSliderDetails({this.success, this.data});

  FeatureSliderDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new SliderData.fromJson(json['data']) : null;
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

class SliderData {
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

  SliderData(
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

  SliderData.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
