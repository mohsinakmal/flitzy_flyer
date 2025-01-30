import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flitzy_flyer/components/ground.dart';
import 'package:flitzy_flyer/constants.dart';
import 'package:flitzy_flyer/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  /*

  INIT BIRD

  */

  // Initialize bird position and size
  Bird()
      : super(
            position: Vector2(birdStartX, birdStartY),
            size: Vector2(birdWidth, birdHeight));

  // physical world properties
  double velocity = 0;

  /*
  
  LOAD

  */

  @override
  FutureOr<void> onLoad() async {
    // load bird sprite image
    sprite = await Sprite.load('bird.png');

    // add a collision box
    add(RectangleHitbox());
  }

  /*
  
  JUMP / FLAP

  */

  void flap() {
    velocity = jumpStrength;
  }

  /*
  
  UPDATE -> every second

  */

  @override
  void update(double dt) {
    // apply gravity
    velocity += gravity * dt;

    // Update bird's position based on current velocity
    position.y += velocity * dt;
  }

  /*

  COLLISION -> with another object  

  */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // check if bird collides with ground
    if (other is Ground) {
      (parent as FlitzyFlyerGame).gameOver();
    }
  }
}
