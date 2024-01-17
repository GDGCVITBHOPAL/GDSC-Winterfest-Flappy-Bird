import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:gdsc_flappy_bird/constants/assets.dart';
import 'package:gdsc_flappy_bird/constants/config.dart';
import 'package:gdsc_flappy_bird/constants/enums.dart';
import 'package:gdsc_flappy_bird/flappy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  final double height;
  final PipePosition pipePos;
  Pipe({
    required this.height,
    required this.pipePos,
  });

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);

    size = Vector2(50, height);

    switch (pipePos) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - Config.groundHeight - size.y;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
