import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(
          text: "Home",
          fontSize: 20,
        ),
      ),
    );
  }
}
