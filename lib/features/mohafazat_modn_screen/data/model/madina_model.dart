class MadinaModel {
  String? sId;
  String? name;
  String? province;
  int? iV;

  MadinaModel({this.sId, this.name, this.province, this.iV});

  MadinaModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    province = json['province'];
    iV = json['__v'];
  }

}