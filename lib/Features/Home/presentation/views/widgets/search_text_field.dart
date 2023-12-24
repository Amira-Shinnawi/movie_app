import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onSubmitted,
    this.onChanged,
    this.onPressedSearch,
  });
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onPressedSearch;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: IconButton(
              onPressed: onPressedSearch,
              icon: const Icon(Icons.search, color: Colors.white24)),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white24)),
          hintStyle: const TextStyle(color: Colors.white54),
          filled: true,
          fillColor: Colors.black.withOpacity(.6),
          hintText: 'Search....'),
    );
  }
}
