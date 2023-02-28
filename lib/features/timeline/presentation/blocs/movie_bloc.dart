import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_timeline/core/util/logger.dart';
import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';
import 'package:movie_timeline/features/timeline/domain/use_cases/list_movies_usecase.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ListMoviesUsecase listMovies;

  MovieBloc({
    required this.listMovies,
  }) : super(MovieInitialState()) {
    on<ListMoviesEvent>(_onListMoviesEvent);
  }

  Future<void> _onListMoviesEvent(
    ListMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    try {
      final movies = await listMovies();
      emit(MovieLoadedState(movies: movies));
    } catch (e) {
      Logger.log(e);
      emit(MovieErrorState());
    }
  }
}
