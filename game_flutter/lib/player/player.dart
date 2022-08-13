import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_flutter/player/player_spritesheet.dart';
import 'dart:async' as async;

class Warrior extends SimplePlayer with ObjectCollision {
  int points = 0;
  bool havePower = false;

  Warrior(Vector2 position)
      : super(
          position: position,
          size: Vector2(32, 32),
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
        ) {
    setupCollision(CollisionConfig(enable: true, collisions: [
      CollisionArea.rectangle(
        size: Vector2(23, 23),
        align: Vector2(5, 6),
      )
    ]));
  }

  void addPoints() {
    points += 10;
  }

  async.Future<void> getPower() async {
    havePower = true;
    await Future.delayed(const Duration(seconds: 8), () {
      havePower = false;
    });
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
