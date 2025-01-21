import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flitzy_flyer/constants.dart';
import 'package:flitzy_flyer/game.dart';

class Ground extends SpriteComponent
    with HasGameRef<FlitzyFlyerGame>, CollisionCallbacks {
  // init
  Ground() : super();

  @override
  FutureOr<void> onLoad() async {
    // set size & position
    size = Vector2(2 * gameRef.size.x, groundHeight);
    position = Vector2(0, gameRef.size.y - groundHeight);

    // load ground sprite image
    sprite = await Sprite.load('ground.png');

    // add a collision box
    add(RectangleHitbox());
  }

  /*
  
  UPDATE -> every second

  */

  @override
  void update(double dt) {
    // move ground to left
    position.x -= groundScrollingSpeed * dt;

    // reset ground if it goes off screen for infinite scroll
    // if half of ground has been passed, reset.
    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}
