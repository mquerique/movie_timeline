import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.posterPath,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: DateTime.parse(json['release_date']),
      voteAverage: json['vote_average'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'backdropPath': backdropPath,
      'posterPath': posterPath,
      'title': title,
      'overview': overview,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
    };
  }
}
