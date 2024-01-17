import 'package:flutter/material.dart';
import 'package:gdsc_flappy_bird/constants/assets.dart';
import 'package:gdsc_flappy_bird/flappy_bird_game.dart';

class GameOver extends StatelessWidget {
  static const String id = 'gameOver';
  final FlappyBirdGame game;
  const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black45,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Score: ${game.bird.score}",
            style: const TextStyle(
              fontFamily: "Game",
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(Assets.gameOver),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text(
              "Restart",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      )),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
