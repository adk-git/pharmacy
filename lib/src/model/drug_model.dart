class DrugModel {
  DrugModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<DrugResult> results;

  factory DrugModel.fromJson(Map<String, dynamic> json) => DrugModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? " ",
        previous: json["previous"] ?? "",
        results: List<DrugResult>.from(
            json["results"].map((x) => DrugResult.fromJson(x))),
      );
}

class DrugResult {
  DrugResult({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.manufacturer,
    this.favourite = false,
  });

  int id;
  String name;
  String image;
  double price;
  Manufacturer manufacturer;
  bool favourite;

  factory DrugResult.fromJson(Map<String, dynamic> json) => DrugResult(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        price: json["price"] ?? 0.0,
        manufacturer: Manufacturer.fromJson(json["manufacturer"]),
      );
}

class Manufacturer {
  Manufacturer({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );
}
