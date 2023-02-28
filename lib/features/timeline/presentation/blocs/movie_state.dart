part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<Movie> movies;

  const MovieLoadedState({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class MovieErrorState extends MovieState {}
