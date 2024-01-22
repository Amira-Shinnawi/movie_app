import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';

part 'fav_movie_state.dart';

class FavMovieCubit extends Cubit<FavMovieState> {
  FavMovieCubit() : super(FavMovieInitial());

  List<MovieModel> selectedMovies = [];

  Map itemQuantity() {
    var quantity = {};
    for (var movie in selectedMovies) {
      quantity[movie.id] = (quantity[movie.id] ?? 0) + 1;
    }
    return quantity;
  }

  void addMovie(MovieModel movie) {
    selectedMovies.add(movie);
    emit(AddMovieToFavList());
  }

  void removeMovie(MovieModel movie) {
    selectedMovies.remove(movie);
    emit(RemoveMovieToFavList());
  }

  void reset() {
    selectedMovies.clear();
    emit(ResetMovieToFavList());
  }
}
