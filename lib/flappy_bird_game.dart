import 'package:flame/game.dart';
import 'package:gdsc_flappy_bird/components/background.dart';
import 'package:gdsc_flappy_bird/components/ground.dart';

class FlappyBirdGame extends FlameGame {
  FlappyBirdGame();

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground()
    ]);
  }
}
