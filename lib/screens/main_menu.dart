import 'package:flutter/material.dart';
import 'package:gdsc_flappy_bird/constants/assets.dart';
import 'package:gdsc_flappy_bird/flappy_bird_game.dart';

class MainMenu extends StatelessWidget {
  static const String id = "mainMenu";
  final FlappyBirdGame game;
  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return GestureDetector(
      onTap: () {
        game.overlays.remove('mainMenu');
        game.resumeEngine();
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.menu), fit: BoxFit.cover)),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
