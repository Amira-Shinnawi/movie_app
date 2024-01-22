import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/fav_movie_list_view.dart';

class FavoriteHomeBody extends StatelessWidget {
  const FavoriteHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(top: 90, bottom: 20, left: 15, right: 15),
      child: Column(
        children: [
          Expanded(
            child: FavoriteMovieListView(),
          )
        ],
      ),
    );
  }
}
