import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_flappy_bird/flappy_bird_game.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(game: game),
  );
}
