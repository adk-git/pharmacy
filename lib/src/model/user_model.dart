class UserModel {
  int id;
  int gender;
  int age;
  String name;

  UserModel({
    required this.id,
    required this.gender,
    required this.age,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['age'] = age;
    data['name'] = name;
    return data;
  }
}
