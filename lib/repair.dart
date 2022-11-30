class Repair {
  int id;
  String serinka;
  String model;
  String defekt;

  String get getSerinka {
    return serinka;
  }



  Repair({
    required this.id,
    required this.serinka,
    required this.model,
    required this.defekt,
  });

  factory Repair.fromJson(Map<String, dynamic> json) {
    return Repair(
        id: json['id'],
        serinka: json['serinka'],
        model: json['model'],
        defekt: json['defekt']);
  }



}
