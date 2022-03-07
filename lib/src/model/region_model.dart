import 'dart:convert';

List<RegionModel> regionModelFromJson(String str) => List<RegionModel>.from(
    json.decode(str).map((x) => RegionModel.fromJson(x)));

class RegionModel {
  RegionModel({
    required this.id,
    required this.name,
    required this.childs,
    required this.coords,
  });

  int id;
  String name;
  List<String> childs;
  List<double> coords;

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        childs: List<String>.from(json["childs"].map((x) => x)),
        coords: List<double>.from(json["coords"].map((x) => x.toDouble())),
      );
}
