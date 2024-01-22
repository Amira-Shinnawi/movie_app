import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';

import '../../../data/repos/home_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.movieHomeRepo) : super(MoviesInitial());
  final MovieHomeRepo movieHomeRepo;

  Future<void> fetchAllMovies({required String movieName}) async {
    emit(MoviesLoading());
    var result = await movieHomeRepo.fetchAllMovies(
      movieName: movieName,
    );
    result.fold((failure) {
      emit(MoviesFailure(failure.errorMessage));
    }, (movies) {
      emit(MoviesSuccess(movies));
    });
  }
}
