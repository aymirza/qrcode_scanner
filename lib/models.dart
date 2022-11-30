class Models {
  int id;
  String modelcode;
  String modelname;
  String modelcolor;

  Models({
    required this.id,
    required this.modelcode,
    required this.modelname,
    required this.modelcolor,
  });

  factory Models.fromJson(Map<String, dynamic> json) {
    return Models(
        id: json['id'],
        modelcode: json['modelcode'],
        modelname: json['modelname'],
        modelcolor: json['modelcolor']);
  }



}
