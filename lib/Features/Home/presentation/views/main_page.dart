import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/Features/Auth/presentation/views/login_page.dart';
import 'package:movie_app/Features/Auth/presentation/views/register_page.dart';
import 'package:movie_app/Features/Home/presentation/views/fav_home.dart';
import 'package:movie_app/Features/Home/presentation/views/movie_home.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentIndex = 0;

  List<Widget> screens = const [
    MovieHome(),
    FavoriteHome(),
    LoginPage(),
    RegisterPage()
  ];

  void _onItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
              unselectedItemColor: Colors.white,
              currentIndex: currentIndex,
              selectedItemColor: Colors.orange,
              type: BottomNavigationBarType.shifting,
              onTap: _onItemTap,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  label: 'Favorites',
                  icon: Icon(
                    FontAwesomeIcons.heart,
                    size: 25,
                  ),
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  label: 'Login',
                  icon: Icon(
                    FontAwesomeIcons.userCheck,
                    size: 30,
                  ),
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  label: 'Signup',
                  icon: Icon(
                    FontAwesomeIcons.user,
                    size: 30,
                  ),
                  backgroundColor: Colors.black,
                ),
              ]),
        ),
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
