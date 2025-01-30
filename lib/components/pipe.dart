import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flitzy_flyer/constants.dart';
import 'package:flitzy_flyer/game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlitzyFlyerGame> {
  // determine if the pipe is top or bottom
  final bool isTopPipe;

  Pipe(Vector2 position, Vector2 size, {required this.isTopPipe})
      : super(position: position, size: size);

  @override
  FutureOr<void> onLoad() async {
    // load pipe sprite image
    sprite = await Sprite.load(isTopPipe ? 'top_pipe.png' : 'bottom_pipe.png');

    // add hit box for collision detection
    add(RectangleHitbox());
  }

  /*

    UPDATE

    */

  @override
  void update(double dt) {
    // scroll pipe to left
    position.x -= groundScrollingSpeed * dt;

    // remove pipe if it goes off screen
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}
