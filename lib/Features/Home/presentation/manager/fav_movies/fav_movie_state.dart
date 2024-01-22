part of 'fav_movie_cubit.dart';

sealed class FavMovieState extends Equatable {
  const FavMovieState();

  @override
  List<Object> get props => [];
}

final class FavMovieInitial extends FavMovieState {}

final class AddMovieToFavList extends FavMovieState {}

final class RemoveMovieToFavList extends FavMovieState {}

final class ResetMovieToFavList extends FavMovieState {}
