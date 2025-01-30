import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flitzy_flyer/components/background.dart';
import 'package:flitzy_flyer/components/bird.dart';
import 'package:flitzy_flyer/components/ground.dart';
import 'package:flitzy_flyer/constants.dart';
import 'package:flutter/material.dart';

class FlitzyFlyerGame extends FlameGame
    with TapDetector, HasCollisionDetection {
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

    // show dialog box for user
    showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: const Text("Restart")),
        ],
      ),
    );
  }

  void resetGame() {
    bird.position = Vector2(birdStartX, birdStartY);
    bird.velocity = 0;
    isGameOver = false;
    resumeEngine();
  }
}
