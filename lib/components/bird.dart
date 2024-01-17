import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_flappy_bird/constants/assets.dart';
import 'package:gdsc_flappy_bird/constants/config.dart';
import 'package:gdsc_flappy_bird/constants/enums.dart';
import 'package:gdsc_flappy_bird/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;
  @override
  Future<void> onLoad() async {
    final mid = await gameRef.loadSprite(Assets.birdMidFlap);
    final down = await gameRef.loadSprite(Assets.birdDownFlap);
    final up = await gameRef.loadSprite(Assets.birdUpFlap);

    size = Vector2(50, 40);
    current = BirdMovement.mid;
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.mid: mid,
      BirdMovement.up: up,
      BirdMovement.down: down,
    };

    add(CircleHitbox());
  }

  void fly() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(duration: 0.2, curve: Curves.decelerate),
      onComplete: () => current = BirdMovement.down,
    ));
    current = BirdMovement.up;
    FlameAudio.play(Assets.flying);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    gameOver();
    super.onCollisionStart(intersectionPoints, other);
  }

  void gameOver() {
    FlameAudio.play(Assets.collision);
    gameRef.pauseEngine();
    gameRef.overlays.add('gameOver');
    gameRef.isHit = true;
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  @override
  void update(double dt) {
    position.y += Config.birdVelocity * dt;
    super.update(dt);

    if (position.y < 1) {
      gameOver();
    }
  }
}
