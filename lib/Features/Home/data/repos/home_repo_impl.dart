import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';
import 'package:movie_app/Features/Home/data/repos/home_repo.dart';
import 'package:movie_app/core/errors/failuers.dart';
import 'package:movie_app/core/utils/api_service.dart';

class MovieHomeRepoImpl implements MovieHomeRepo {
  final APIService apiService;

  MovieHomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchAllMovies({required String movieName}) async {
    try {
  var data = await apiService.getALlMovie(endPoint: 'search/movie?api_key=6558e3f476677934bef2df3b734e7fed&query=$movieName');
      List<MovieModel> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(MovieModel.fromJson(item));
        } catch (e) {
          movies.add(MovieModel.fromJson(item));
        }
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
