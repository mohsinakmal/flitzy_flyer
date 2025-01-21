import 'dart:async';

import 'package:flame/components.dart';
import 'package:flitzy_flyer/constants.dart';

class Bird extends SpriteComponent {
  /*

  INIT BIRD

  */

  // Initialize bird position and size
  Bird() : super(position: Vector2(birdStartX, birdStartY), size: Vector2(birdWidth, birdHeight));

  // physical world properties
  double velocity = 0;

  /*
  
  LOAD

  */

  @override
  FutureOr<void> onLoad() async {
    // load bird sprite image
    sprite = await Sprite.load('bird.png');
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
}
