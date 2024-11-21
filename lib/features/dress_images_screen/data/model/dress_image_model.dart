class DressImageModel {
  String? sId;
  String? imageUrl;
  String? description;
  int? iV;

  DressImageModel({this.sId, this.imageUrl, this.description, this.iV});

  DressImageModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    iV = json['__v'];
  }

 
}