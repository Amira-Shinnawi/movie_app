import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:movie_app/Features/Home/presentation/manager/fav_movies/fav_movie_cubit.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/firebase_options.dart';

import 'Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'Features/Home/presentation/manager/display_all_movies/movies_cubit.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit(
            getIt.get<MovieHomeRepoImpl>(),
          )..fetchAllMovies(
              movieName: 'oppenheimer',
            ),
        ),
        BlocProvider(
          create: (context) => FavMovieCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Inter',
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
