class BadlaImageModel {
  String? sId;
  String? imageUrl;
  String? description;
  int? iV;

  BadlaImageModel({this.sId, this.imageUrl, this.description, this.iV});

  BadlaImageModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    iV = json['__v'];
  }


}