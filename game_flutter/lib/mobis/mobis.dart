import 'package:bonfire/bonfire.dart';
import 'package:game_flutter/mobis/mobis_spritesheet.dart';
import 'package:game_flutter/player/player.dart';

class Mobi extends SimpleEnemy with ObjectCollision {
  final Warrior warrior;
  bool isVulnerable = false;

  Mobi(Vector2 position, this.warrior)
      : super(
          position: position,
          size: Vector2(28, 28),
          speed: 40,
          animation: MobiSpriteSheet.simpleDirectionAnimation,
        ) {
    setupCollision(CollisionConfig(enable: true, collisions: [
      CollisionArea.rectangle(
        size: Vector2(20, 20),
        align: Vector2(0, 0),
      )
    ]));
  }

  @override
  void update(double dt) {
    if (warrior.havePower) {
      isVulnerable = true;
    } else {
      isVulnerable = false;
    }

    seeAndMoveToPlayer(
      closePlayer: (
        player,
      ) {
        if (!isVulnerable) {
          player.die();
        } else {
          position = Vector2(19 * 16, 12 * 16);
          opacity = 1;
        }
      },
      radiusVision: 400,
      margin: 4,
    );

    seeAndMoveToPlayer(
      closePlayer: (
        player,
      ) {
        if (!isVulnerable) {
          player.die();
        } else {
          position = Vector2(18 * 16, 12 * 16);
          opacity = 1;
        }
      },
      radiusVision: 400,
      margin: 4,
    );

    if (isVulnerable) {
      opacity = 0.3;
      // animation = InMobiSpriteSheet.simpleDirectionAnimation;
    } else {
      opacity = 1;
    }
    super.update(dt);
  }
}
