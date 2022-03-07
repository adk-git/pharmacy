

class CatalogModel {
  CatalogModel({
   required this.count,
   required this.next,
   required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<CatalogResult> results;

  factory CatalogModel.fromJson(Map<String, dynamic> json) => CatalogModel(
    count: json["count"] ?? 0,
    next: json["next"] ?? "",
    previous: json["previous"] ?? "",
    results: List<CatalogResult>.from(json["results"].map((x) => CatalogResult.fromJson(x))),
  );


}

class CatalogResult {
  CatalogResult({
    required this.id,
  required  this.name,
   required this.image,
    required this.slug,
    required this.childs,
  });

  int id;
  String name;
  String image;
  String slug;
  List<CatalogResult> childs;

  factory CatalogResult.fromJson(Map<String, dynamic> json) => CatalogResult(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    image: json["image"] ?? "",
    slug: json["slug"] ?? "",
    childs: List<CatalogResult>.from(json["childs"].map((x) => CatalogResult.fromJson(x))),
  );


}
