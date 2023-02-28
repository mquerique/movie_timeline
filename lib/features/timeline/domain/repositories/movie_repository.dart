import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> listMovies();
}
