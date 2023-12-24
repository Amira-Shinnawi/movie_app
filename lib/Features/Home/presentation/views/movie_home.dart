import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/movie_home_view_body.dart';

class MovieHome extends StatelessWidget {
  const MovieHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: MovieHomeBody())),
    );
  }
}
