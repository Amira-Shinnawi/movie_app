import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/data/models/movie_model.dart';
import 'package:movie_app/Features/Home/presentation/manager/fav_movies/fav_movie_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/bottom_fav_add.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/cached_network_image.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool favMovieAdd = false;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Row(
        children: [
          CachedNetwokImage(movieModel: widget.movieModel),
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
                        widget.movieModel.originalTitle!,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      widget.movieModel.voteAverage!.toStringAsPrecision(2),
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
                Text(
                  '${widget.movieModel.originalLanguage!.toUpperCase()} | R: ${widget.movieModel.adult} | ${widget.movieModel.releaseDate}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.5,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.movieModel.overview!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                ButtonFavMovie(
                  onPressed: () {
                    final favMovieCubit =
                        BlocProvider.of<FavMovieCubit>(context);
                    if (favMovieAdd) {
                      favMovieCubit.removeMovie(widget.movieModel);
                    } else {
                      favMovieCubit.addMovie(widget.movieModel);
                    }
                    setState(() {
                      favMovieAdd = !favMovieAdd;
                    });
                  },
                  icon: Icon(
                    favMovieAdd ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: 25,
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
