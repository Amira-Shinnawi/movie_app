import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/fav_movie_details.dart';

import '../../manager/fav_movies/fav_movie_cubit.dart';

class FavoriteMovieListView extends StatefulWidget {
  FavoriteMovieListView({
    super.key,
    this.movieModel,
  });
  MovieModel? movieModel;

  @override
  State<FavoriteMovieListView> createState() => _FavoriteMovieListViewState();
}

class _FavoriteMovieListViewState extends State<FavoriteMovieListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavMovieCubit, FavMovieState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount:
              BlocProvider.of<FavMovieCubit>(context).selectedMovies.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) {
            final bloc =
                BlocProvider.of<FavMovieCubit>(context).selectedMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: FavoriteMovieDetails(
                movieModel: bloc,
                onPressed: () {
                  setState(() {
                    BlocProvider.of<FavMovieCubit>(context).removeMovie(bloc);
                  });
                },
              ),
            );
          }),
        );
      },
    );
  }
}
