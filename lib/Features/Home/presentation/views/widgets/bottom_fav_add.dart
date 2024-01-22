import 'package:flutter/material.dart';

class ButtonFavMovie extends StatelessWidget {
  const ButtonFavMovie({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}