class Ka3aModel {
  String? sId;
  String? name;
  String? city;
  String? phone;
  String? facebook;
  String? instagram;
  String? photos;
  String? location;
  int? iV;

  Ka3aModel(
      {this.sId,
      this.name,
      this.city,
      this.phone,
      this.facebook,
      this.instagram,
      this.photos,
      this.location,
      this.iV});

  Ka3aModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    city = json['city'];
    phone = json['phone'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    photos = json['photos'];
    location = json['location'];
    iV = json['__v'];
  }

  
}