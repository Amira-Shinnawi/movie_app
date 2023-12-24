import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:movie_app/Features/Home/presentation/manager/cubit/movies_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/movie_home.dart';
import 'package:movie_app/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
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
              movieName: 'mission',
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MovieHome(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
