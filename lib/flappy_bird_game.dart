import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:flame/timer.dart';
import 'package:flutter/widgets.dart';
import 'package:gdsc_flappy_bird/components/background.dart';
import 'package:gdsc_flappy_bird/components/bird.dart';
import 'package:gdsc_flappy_bird/components/ground.dart';
import 'package:gdsc_flappy_bird/components/pipe_group.dart';
import 'package:gdsc_flappy_bird/constants/config.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }

  TextComponent buildScore() {
    return TextComponent(
        text: "Score: 0",
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: const TextStyle(
          fontFamily: "Game",
          fontSize: 40,
          fontWeight: FontWeight.bold,
        )));
  }

  @override
  void update(double dt) {
    interval.update(dt);

    score.text = "Score: ${bird.score}";
    super.update(dt);
  }
}
