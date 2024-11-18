class MohafzaModel {
  String? sId;
  String? name;
  String? province;
  int? iV;

  MohafzaModel({this.sId, this.name, this.province, this.iV});

  MohafzaModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    province = json['province'];
    iV = json['__v'];
  }

 
}