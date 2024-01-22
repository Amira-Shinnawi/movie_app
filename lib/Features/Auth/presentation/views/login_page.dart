import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/Features/Auth/presentation/views/widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/mm.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 13,
          sigmaY: 13,
        ),
        child: LoginPageBody(),
      ),
    ));
  }
}
