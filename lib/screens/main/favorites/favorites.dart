import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(
          text: "Favorites",
          fontSize: 20,
        ),
      ),
    );
  }
}
