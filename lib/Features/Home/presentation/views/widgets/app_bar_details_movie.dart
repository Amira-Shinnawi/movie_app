import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/presentation/manager/fav_movies/fav_movie_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/fav_home.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/bottom_fav_add.dart';

import '../../../data/models/movie_model.dart';

class AppBarDetailsMovie extends StatefulWidget {
  const AppBarDetailsMovie({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;

  @override
  State<AppBarDetailsMovie> createState() => _AppBarDetailsMovieState();
}

class _AppBarDetailsMovieState extends State<AppBarDetailsMovie> {
  bool favMovieAdd = false;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 25,
            ),
          ),
          ButtonFavMovie(
            onPressed: () {
              final favMovieCubit = BlocProvider.of<FavMovieCubit>(context);
              if (favMovieAdd) {
                favMovieCubit.removeMovie(widget.movieModel);
              } else {
                favMovieCubit.addMovie(widget.movieModel);
              }
              setState(() {
                favMovieAdd = !favMovieAdd;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteHome()));
            },
            icon: Icon(
              favMovieAdd ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
