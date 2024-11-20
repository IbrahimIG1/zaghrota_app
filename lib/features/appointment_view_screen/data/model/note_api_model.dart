class NotaApiModel {
  String? sId;
  String? date;
  String? title;
  String? content;
  String? hash;
  String? type;
  int? iV;

  NotaApiModel(
      {this.sId,
      this.date,
      this.title,
      this.content,
      this.hash,
      this.type,
      this.iV});

  NotaApiModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    title = json['title'];
    content = json['content'];
    hash = json['hash'];
    type = json['type'];
    iV = json['__v'];
  }

 
}