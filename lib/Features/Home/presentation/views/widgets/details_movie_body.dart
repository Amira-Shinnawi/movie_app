import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/cached_network_image.dart';

import 'app_bar_details_movie.dart';
import 'more_details_movie.dart';

class DetailsMovieHomeBody extends StatelessWidget {
  const DetailsMovieHomeBody({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: 300,
                child: CachedNetwokImage(movieModel: movieModel),
              ),
            ),
            AppBarDetailsMovie(
              movieModel: movieModel,
            )
          ],
        ),
        Expanded(
          child: MoreDetailsMovie(
            movieModel: movieModel,
          ),
        )
      ],
    );
  }
}
