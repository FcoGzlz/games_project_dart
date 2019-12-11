// To parse this JSON data, do
//
//     final pelicula = peliculaFromJson(jsonString);

import 'dart:convert';

Pelicula peliculaFromJson(String str) => Pelicula.fromJson(json.decode(str));
// String peliculaToJson(Pelicula data) => json.encode(data.toJson());

class Peliculas{
  List<Pelicula> items = new List();
  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    jsonList.forEach((item){
        final pelicula = new Pelicula.fromJson(item);
        items.add(pelicula);
    });
  }
}
class Pelicula {
  String uniqueId;//id unico para trabajar con Hero Animation Wuidget

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  DateTime releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) => Pelicula(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );

  getPosterImg() {
    if (posterPath == null) {
      return 'https://www.dragonclawacademy.com/wp-content/uploads/2017/04/default-image.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
  }

  getBackgroundImg() {
    if (backdropPath == null) {
      return 'https://www.dragonclawacademy.com/wp-content/uploads/2017/04/default-image.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }
  }
}
