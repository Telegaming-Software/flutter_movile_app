class Coach {
  int? coachId;
  String? name;
  String? email;
  String? password;
  String? field;
  String? birthDate;
  int? age;

  Coach(
      {this.coachId,
      this.name,
      this.email,
      this.password,
      this.field,
      this.birthDate,
      this.age});

  Coach.fromJson(Map<String, dynamic> json) {
    coachId = json['coachId'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    field = json['field'];
    birthDate = json['birthDate'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coachId'] = coachId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['field'] = field;
    data['birthDate'] = birthDate;
    data['age'] = age;
    return data;
  }
}
