import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        posterPath,
        title,
        overview,
        releaseDate,
        voteAverage,
      ];
}
