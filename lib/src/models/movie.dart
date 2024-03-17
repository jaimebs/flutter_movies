class Movie {
  int id;
  String posterPath;
  DateTime releaseDate;
  String title;
  String overview;

  Movie({
    required this.id,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        posterPath: json["poster_path"] ?? "",
        releaseDate:
            json["release_date"] != null && json["release_date"].isNotEmpty
                ? DateTime.parse(json["release_date"])
                : DateTime(2000, 1, 1),
        title: json["title"] ?? "",
        overview: json["overview"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "overview": overview,
      };
}
