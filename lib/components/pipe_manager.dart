import 'package:flame/components.dart';
import 'package:flitzy_flyer/game.dart';

class PipeManager extends Component with HasGameRef<FlitzyFlyerGame> {
  /*

  UPDATE -> every second (dt)

  We will continuously spawn new pipes.

  */

  double pipeSpawnTimer = 0;

  @override
  void update(double dt) {
    // generate new pipe at given interval
    pipeSpawnTimer += dt;
    const double pipeInterval = 50;

    if (pipeSpawnTimer > pipeInterval) {
      pipeSpawnTimer = 0;
      spawnPipe();
    }
  }

  /* 

  SPAWN NEW PIPES

  */

  void spawnPipe() {
    final double screenHeight = gameRef.size.y;
    const double pipeGap = 150;
    const double minPipeHeight = 50;
    const double pipeWidth = 60;
  }
}
