import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/presentation/views/fav_home.dart';

import 'widgets/movie_home_view_body.dart';

class MovieHome extends StatelessWidget {
  const MovieHome({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteHome(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.movie,
                  size: 30,
                ))
          ],
        ),
        body: MovieHomeBody(),
      ),
    );
  }
}
