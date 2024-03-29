import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';

import '../../manager/display_all_movies/movies_cubit.dart';
import 'movie_details.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kMovieDetailsView,
                        extra: state.movies[index]);
                  },
                  child: MovieDetails(
                    movieModel: state.movies[index],
                  ),
                ),
              );
            },
          );
        } else if (state is MoviesFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
