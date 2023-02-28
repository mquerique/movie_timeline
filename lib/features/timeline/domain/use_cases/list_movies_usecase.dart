import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';
import 'package:movie_timeline/features/timeline/domain/repositories/movie_repository.dart';

class ListMoviesUsecase {
  final MovieRepository repository;

  const ListMoviesUsecase(this.repository);

  Future<List<Movie>> call() async {
    return repository.listMovies();
  }
}
