

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_flappy_bird/flappy_bird_game.dart';
import 'package:gdsc_flappy_bird/screens/game_over.dart';
import 'package:gdsc_flappy_bird/screens/main_menu.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(game: game,
    initialActiveOverlays: const [MainMenu.id],
    overlayBuilderMap: {
      "mainMenu":(context,_)=> MainMenu(game: game),
      "gameOver":(context,_)=> GameOver(game: game),
    },)
  );
}
