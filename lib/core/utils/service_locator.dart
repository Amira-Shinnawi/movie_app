import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:movie_app/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIService>(
    APIService(
      Dio(),
    ),
  );
  getIt.registerSingleton<MovieHomeRepoImpl>(
    MovieHomeRepoImpl(
      getIt.get<APIService>(),
    ),
  );
}
