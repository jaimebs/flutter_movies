class Movie {
  int id;
  String posterPath;
  DateTime releaseDate;
  String title;

  Movie({
    required this.id,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
      };
}
