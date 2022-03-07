class SaleModel {
  SaleModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<SaleResult> results;

  factory SaleModel.fromJson(Map<String, dynamic> json) => SaleModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: List<SaleResult>.from(
            json["results"].map((x) => SaleResult.fromJson(x))),
      );
}

class SaleResult {
  SaleResult({
    required this.id,
    required this.image,
  });

  int id;
  String image;

  factory SaleResult.fromJson(Map<String, dynamic> json) => SaleResult(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
      );
}
