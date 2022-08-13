import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:game_flutter/controller/game_controller.dart';
import 'package:game_flutter/mobis/mobis.dart';
import 'package:game_flutter/player/player.dart';
import 'package:game_flutter/points/points.dart';
import 'package:game_flutter/points/points_interface.dart';
import 'package:game_flutter/power/power.dart';
import 'package:game_flutter/teleports/teleports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Labirinto Escribo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  @override
  Widget build(BuildContext context) {
    Warrior warrior = Warrior(Vector2(5 * 16, 15 * 16));

    return BonfireTiledWidget(
      showCollisionArea: true,
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
        directional: JoystickDirectional(),
      ),
      map: TiledWorldMap(
        'map/map.json',
        objectsBuilder: {
          'points': (properties) => Points(properties.position),
          'power': (properties) => Power(properties.position),
          'mobis': (properties) => Mobi(properties.position, warrior),
          'teleports': (properties) =>
              Teleport(properties.position, properties.id)
        },
        forceTileSize: Size(16, 16),
      ),
      overlayBuilderMap: {
        'points': (context, game) => PointsInterface(
              game: game,
              warrior: warrior,
            )
      },
      components: [MyGameController()],
      initialActiveOverlays: const [PointsInterface.overlaykey],
      player: warrior,
      cameraConfig: CameraConfig(
        moveOnlyMapArea: false,
        sizeMovementWindow: Vector2(1000, 1000),
      ),
    );
  }
}
