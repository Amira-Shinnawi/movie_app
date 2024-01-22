import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';

import 'custom_rating_bar.dart';

class MoreDetailsMovie extends StatelessWidget {
  MoreDetailsMovie({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity(.9),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '${movieModel.originalTitle} (${movieModel.releaseDate})',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomRatingBar(
            rating: movieModel.voteAverage,
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'StoryLine',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${movieModel.overview}',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 95, 93, 93),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
                child: Text(
              movieModel.originalLanguage!.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
          ),
        ]),
      ),
    );
  }
}
