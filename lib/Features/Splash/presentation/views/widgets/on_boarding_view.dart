import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            isLastPage = value == 2;
          });
        },
        controller: controller,
        children: const [
          FirstWelcomeBody(),
        ],
      ),
    ));
  }
}

class FirstWelcomeBody extends StatelessWidget {
  const FirstWelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: OnBoardingBody(
              height: 400,
              imgPath: "assets/images/oppenheimer.jpeg",
              title: "Discover",
              supTitle: "Explore world top brands and boutiques",
            ),
          ),
        ),
      ],
    );
  }
}

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.height,
    required this.imgPath,
    required this.title,
    required this.supTitle,
  });

  final double height;
  final String imgPath;
  final String title;
  final String supTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            width: 200,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 36,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              supTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
