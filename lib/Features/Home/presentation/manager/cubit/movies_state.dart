part of 'movies_cubit.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

final class MoviesInitial extends MoviesState {}
final class MoviesLoading extends MoviesState {}

final class MoviesSuccess extends MoviesState {
  final List<MovieModel> movies;

  const MoviesSuccess(this.movies);
}

final class MoviesFailure extends MoviesState {
  final String errorMessage;

  const MoviesFailure(this.errorMessage);
}
