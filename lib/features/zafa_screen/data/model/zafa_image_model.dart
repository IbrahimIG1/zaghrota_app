class ZafaImageModel {
  String? sId;
  String? imageUrl;
  int? iV;

  ZafaImageModel({this.sId, this.imageUrl, this.iV});

  ZafaImageModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageUrl = json['imageUrl'];
    iV = json['__v'];
  }

 
}