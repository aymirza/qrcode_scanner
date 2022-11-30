class Users {
  final int id;
  final String name;

  String get getName {
    return name;
  }

  Users({
    required this.id,
    required this.name,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(id: json['id'], name: json['name']);
  }
}
