class PagesModel {
  PagesModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<PagesResult> results;

  factory PagesModel.fromJson(Map<String, dynamic> json) => PagesModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: List<PagesResult>.from(
            json["results"].map((x) => PagesResult.fromJson(x))),
      );
}

class PagesResult {
  PagesResult({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
  });

  int id;
  String title;
  String image;
  DateTime createdAt;

  factory PagesResult.fromJson(Map<String, dynamic> json) => PagesResult(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        image: json["image"] ?? "",
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
      );
}
