class Gamer {
  int? id;
  String? name;
  String? email;
  String? password;
  String? birthDate;
  int? age;
  double? balance;

  Gamer(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.birthDate,
      this.age,
      this.balance});

  Gamer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    birthDate = json['birthDate'];
    age = json['age'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['birthDate'] = birthDate;
    data['age'] = age;
    data['balance'] = balance;
    return data;
  }
}
