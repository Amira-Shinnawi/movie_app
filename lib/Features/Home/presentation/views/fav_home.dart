import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/fav_home_body.dart';

class FavoriteHome extends StatelessWidget {
  const FavoriteHome({super.key});

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
            title: const Text(
              'Favorite Movies',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/oppenheimer.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: const FavoriteHomeBody(),
            ),
          )),
    );
  }
}
