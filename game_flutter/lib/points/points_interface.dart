import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';
import 'package:game_flutter/player/player.dart';
import 'dart:async' as async;

class PointsInterface extends StatefulWidget {
  static const overlaykey = 'points';
  final BonfireGame game;
  final Warrior warrior;

  const PointsInterface({Key? key, required this.game, required this.warrior})
      : super(key: key);

  @override
  State<PointsInterface> createState() => _PointsInterfaceState();
}

class _PointsInterfaceState extends State<PointsInterface> {
  int points = 0;
  late async.Timer _time;

  @override
  void initState() {
    _time =
        async.Timer.periodic(const Duration(milliseconds: 100), _verifyPoints);

    super.initState();
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      width: 120,
      height: 500,
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          "Pontos $points",
          maxLines: 1,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  void _verifyPoints(async.Timer timer) {
    if (points != widget.warrior.points) {
      setState(() {
        points = widget.warrior.points;
      });
    }
  }
}
