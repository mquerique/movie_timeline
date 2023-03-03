import 'package:get_it/get_it.dart';
import 'package:movie_timeline/core/themes/bloc/theme_bloc.dart';
import 'package:movie_timeline/features/timeline/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_timeline/features/timeline/data/repositories/movie_repository_impl.dart';
import 'package:movie_timeline/features/timeline/domain/repositories/movie_repository.dart';
import 'package:movie_timeline/features/timeline/domain/use_cases/list_movies_usecase.dart';
import 'package:movie_timeline/features/timeline/presentation/blocs/movie_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Blocs
  getIt.registerLazySingleton(() => ThemeBloc());
  getIt.registerLazySingleton(() => MovieBloc(listMovies: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => ListMoviesUsecase(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
    () => const MovieRemoteDataSource(),
  );
}
