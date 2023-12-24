import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/cached_network_image.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: Row(
        children: [
          CachedNetwokImage(movieModel: movieModel),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieModel.originalTitle!,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      movieModel.voteAverage!.toStringAsPrecision(2),
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
                Text(
                  '${movieModel.originalLanguage!.toUpperCase()} | R: ${movieModel.adult} | ${movieModel.releaseDate}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.5,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  movieModel.overview!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
