class Game {
  String? name;
  String? description;
  String? coverUri;
  int? id;

  Game({this.name, this.description, this.coverUri, this.id});

  Game.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    coverUri = json['coverUri'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['coverUri'] = coverUri;
    data['id'] = id;
    return data;
  }
}
