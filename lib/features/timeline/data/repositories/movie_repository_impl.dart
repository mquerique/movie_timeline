import 'package:movie_timeline/features/timeline/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';
import 'package:movie_timeline/features/timeline/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  const MovieRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Movie>> listMovies() {
    return remoteDataSource.listMovies();
  }
}
