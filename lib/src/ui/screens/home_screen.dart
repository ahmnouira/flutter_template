import 'package:flutter/material.dart';
import 'package:flutter_template/src/data/assets/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.welcomeHero);
  }
}
