import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/Features/Auth/presentation/views/login_page.dart';
import 'package:movie_app/Features/Auth/presentation/views/register_page.dart';
import 'package:movie_app/Features/Auth/presentation/views/widgets/custom_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/movie.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/kk.png',
                ),
                // const Text(
                //   'Welcome To Movie App !',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 44,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
                const SizedBox(
                  height: 100,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    buttonName: 'Login'),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    buttonName: 'Sign Up'),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
