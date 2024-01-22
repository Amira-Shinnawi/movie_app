import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';

import 'widgets/details_movie_body.dart';

class DetailsMovieHome extends StatelessWidget {
  const DetailsMovieHome({super.key, required this.model});
  final MovieModel model;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DetailsMovieHomeBody(
          movieModel: model,
        ),
      ),
    );
  }
}
