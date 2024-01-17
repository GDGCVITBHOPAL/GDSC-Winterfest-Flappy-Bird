import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:gdsc_flappy_bird/components/pipe.dart';
import 'package:gdsc_flappy_bird/constants/assets.dart';
import 'package:gdsc_flappy_bird/constants/config.dart';
import 'package:gdsc_flappy_bird/constants/enums.dart';
import 'package:gdsc_flappy_bird/flappy_bird_game.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();
  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    final heightWOground = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightWOground / 4);
    final centerY = spacing + _random.nextDouble() * (heightWOground - spacing);

    addAll([
      Pipe(
          height: heightWOground - (centerY + spacing / 2),
          pipePos: PipePosition.bottom),
      Pipe(height: centerY - spacing / 2, pipePos: PipePosition.top),
    ]);
  }

  @override
  void update(double dt) {
    position.x -= Config.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
    super.update(dt);
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }
}
