import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';
import 'package:movie_app/core/errors/failuers.dart';

abstract class MovieHomeRepo {
  Future<Either<Failure, List<MovieModel>>> fetchAllMovies({required String movieName});
}
