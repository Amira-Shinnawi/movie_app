import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/Auth/presentation/views/login_page.dart';
import 'package:movie_app/Features/Auth/presentation/views/register_page.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';
import 'package:movie_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:movie_app/Features/Home/presentation/manager/display_all_movies/movies_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/movie_home.dart';
import 'package:movie_app/core/utils/service_locator.dart';

import '../../Features/Home/presentation/views/details_movie_home.dart';

abstract class AppRouter {

  static const kHomeView = '/homeView';
  static const kMovieDetailsView = '/movieDetailsView';
  static const kRegister = '/registerPage';
  // static const kLogin = '/loginPage';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const MovieHome(),
    ),
    GoRoute(
      path: kMovieDetailsView,
      builder: (context, state) => BlocProvider(
          create: (context) => MoviesCubit(getIt.get<MovieHomeRepoImpl>()),
          child: DetailsMovieHome(
            model: state.extra as MovieModel,
          )),
    ),
    GoRoute(
      path: kRegister,
      builder: (context, state) => const RegisterPage(),
    ),
    // GoRoute(
    //   path: kLogin,
    //   builder: (context, state) => const LoginPage(),
    // ),

  ]);
}
