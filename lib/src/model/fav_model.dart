class FavModel {
  int id;
  String name;
  String image;

  FavModel({
    required this.id,
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}
