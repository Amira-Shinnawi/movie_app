import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/presentation/manager/cubit/movies_cubit.dart';

import 'custom_snack_bar.dart';
import 'movie_list_view_item.dart';
import 'search_text_field.dart';

class MovieHomeBody extends StatelessWidget {
  MovieHomeBody({
    super.key,
  });
  String? movieName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 80, bottom: 20),
      child: Column(
        children: [
          SearchTextField(
            onChanged: (value) {
              movieName = value;
            },
            onSubmitted: (value) {
              movieName = value;
              BlocProvider.of<MoviesCubit>(context)
                  .fetchAllMovies(movieName: movieName!);
            },
            onPressedSearch: () {
              if (movieName != null) {
                BlocProvider.of<MoviesCubit>(context)
                    .fetchAllMovies(movieName: movieName!);
              } else {
                return customSnackBar(context, 'Please Enter Search Book Name');
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          const Expanded(
            child: MovieListViewItem(),
          )
        ],
      ),
    );
  }
}
