import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';

class TeleportSpriteSheet {
  static Future<Sprite> get teleport => Sprite.load(
        'transparent.png',
        srcPosition: Vector2(2, 2),
        srcSize: Vector2(16, 16),
      );
}

class Teleport extends GameDecoration with Sensor {
  final int? id;

  Teleport(Vector2 position, this.id)
      : super.withSprite(
          sprite: TeleportSpriteSheet.teleport,
          position: position,
          size: Vector2(16, 16),
        );

  @override
  void render(Canvas canvas) {
    opacity = 0;
    super.render(canvas);
  }

  @override
  void onContact(GameComponent component) {
    if (id == 85) {
      (component).position = Vector2(36 * 16, 11 * 16);
    } else if (id == 86) {
      (component).position = Vector2(3 * 16, 11 * 16);
    }
  }
}
