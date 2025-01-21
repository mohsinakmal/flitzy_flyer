import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flitzy_flyer/components/background.dart';
import 'package:flitzy_flyer/components/bird.dart';
import 'package:flitzy_flyer/components/ground.dart';

class FlitzyFlyerGame extends FlameGame with TapDetector {
  /*

  Basic Game Components
  -bird
  -background
  -ground
  -pipes
  -score

  */

  late Bird bird;
  late Background background;
  late Ground ground;

  /*

  LOAD

  */

  @override
  FutureOr<void> onLoad() {
    // load backgroud
    background = Background(size);
    add(background);

    // load bird
    bird = Bird();
    add(bird);

    // load ground
    ground = Ground();
    add(ground);
  }

  /*

  TAP

  */

  @override
  void onTap() {
    bird.flap();
  }

  /*

  GAME OVER

  */

  bool isGameOver = false;

  void gameOver() {
    // Prevent multiple game over triggers
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();
  }
}
