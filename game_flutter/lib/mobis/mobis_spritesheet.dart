import 'package:bonfire/bonfire.dart';

class MobiSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "mobis.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.5,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: idleRight,
      );
}

class InMobiSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "mobis.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.5,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32 * 8, 0),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: idleRight,
      );
}
