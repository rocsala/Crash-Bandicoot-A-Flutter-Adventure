import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';

import 'components/fruta_wumpa.dart';
import 'components/nitro.dart';
import 'components/player.dart';
import 'components/finish_point.dart';
import 'components/world.dart';
import 'components/world_collidable.dart';
import 'components/water_collidable.dart';
import 'helpers/direction.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'helpers/map_loader.dart';

// HasCollidables = Posseix objectes amb col·lisio
class RayWorldGame extends FlameGame with HasCollidables, KeyboardEvents {
  BuildContext context_;
  RayWorldGame(this.context_);
  // ignore: prefer_final_fields
  late final Player _player = Player(context_);
  final World _world = World();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    add(_player);
    add(Finish(await loadSprite('Finish.png')));
    addWumpaCollision();
    addNitroCollision();
    addWorldCollision();
    addWaterCollision();
    _player.position = _world.size / 18;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  // void dispose() {
  //   audioPlayer.dispose();

  //   super.dispose();
  // }
  @override
  void addWorldCollision() async =>
      (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
        add(WorldCollidable()
          ..position = Vector2(rect.left, rect.top)
          ..width = rect.width
          ..height = rect.height);
      });

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }

  WorldCollidable createWorldCollidable(Rect rect) {
    final collidable = WorldCollidable();
    collidable.position = Vector2(rect.left, rect.top);
    collidable.width = rect.width;
    collidable.height = rect.height;
    return collidable;
  }

  @override
  void addWaterCollision() async =>
      (await WaterLoader.readRayWorldCollisionWater()).forEach((rect) {
        add(WaterCollidable()
          ..position = Vector2(rect.left, rect.top)
          ..width = rect.width
          ..height = rect.height);
      });

  WaterCollidable createWaterCollidable(Rect rect) {
    final collidable = WaterCollidable();
    collidable.position = Vector2(rect.left, rect.top);
    collidable.width = rect.width;
    collidable.height = rect.height;
    return collidable;
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    Direction? keyDirection = null;

    if (event.logicalKey == LogicalKeyboardKey.keyA) {
      keyDirection = Direction.left;
    } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      keyDirection = Direction.right;
    } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      keyDirection = Direction.up;
    } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      keyDirection = Direction.down;
    }

    if (isKeyDown && keyDirection != null) {
      _player.direction = keyDirection;
    } else if (_player.direction == keyDirection) {
      _player.direction = Direction.none;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  Future<void> addNitroCollision() async {
add(Nitro(await loadSprite('NITRO.png'), 623, 147));
    add(Nitro(await loadSprite('NITRO.png'), 2448, 1072));
    add(Nitro(await loadSprite('NITRO.png'), 2671, 1010));
    add(Nitro(await loadSprite('NITRO.png'), 2640, 1138));
    add(Nitro(await loadSprite('NITRO.png'), 2191, 1137));
    add(Nitro(await loadSprite('NITRO.png'), 2064, 1075));
    add(Nitro(await loadSprite('NITRO.png'), 1871, 1105));
    add(Nitro(await loadSprite('NITRO.png'), 1744, 1106));
    add(Nitro(await loadSprite('NITRO.png'), 1648, 1037));
    add(Nitro(await loadSprite('NITRO.png'), 912, 1168));
    add(Nitro(await loadSprite('NITRO.png'), 428, 1138));
    add(Nitro(await loadSprite('NITRO.png'), 948, 128));
    add(Nitro(await loadSprite('NITRO.png'), 960, 289));
    add(Nitro(await loadSprite('NITRO.png'), 1249, 168));
    add(Nitro(await loadSprite('NITRO.png'), 2908, 284));
    add(Nitro(await loadSprite('NITRO.png'), 98, 644));
    add(Nitro(await loadSprite('NITRO.png'), 127, 1311));
    add(Nitro(await loadSprite('NITRO.png'), 381, 1536));
    add(Nitro(await loadSprite('NITRO.png'), 2622, 2340));
    add(Nitro(await loadSprite('NITRO.png'), 1798, 293));
    add(Nitro(await loadSprite('NITRO.png'), 2784, 379));
    add(Nitro(await loadSprite('NITRO.png'), 3005, 128));
    add(Nitro(await loadSprite('NITRO.png'), 2965, 724));
    add(Nitro(await loadSprite('NITRO.png'), 3031, 982));
    add(Nitro(await loadSprite('NITRO.png'), 1983, 459));
    add(Nitro(await loadSprite('NITRO.png'), 1690, 459));
    add(Nitro(await loadSprite('NITRO.png'), 1248, 1301));
    add(Nitro(await loadSprite('NITRO.png'), 1411, 1510));
    add(Nitro(await loadSprite('NITRO.png'), 2317, 1316));
    add(Nitro(await loadSprite('NITRO.png'), 2154, 1395));
    add(Nitro(await loadSprite('NITRO.png'), 2308, 2406));
    add(Nitro(await loadSprite('NITRO.png'), 2493, 2137));
  }

  @override
  Future<void> addWumpaCollision() async {
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 300.0, 289.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 561.0, 117.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 909.0, 304.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2487.0, 251.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2815.0, 331.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 3035.0, 304.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 3104.0, 343.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2745.0, 477.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2857.0, 289.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2875.0, 642.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 909.0, 304.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2179.0, 569.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2142.0, 304.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2607.0, 1061.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2227.0, 1066.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2225.0, 1049.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2075.0, 1169.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2090.0, 1037.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1958.0, 1105.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1626.0, 1042.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1530.0, 1014.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1506.0, 1014.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1346.0, 1009.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1356.0, 1009.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1159.0, 1153.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1059.0, 1153.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 807.0, 939.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 801.0, 1149.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 663.0, 1105.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 440.0, 1160.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 509.0, 932.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 422.0, 932.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 269.0, 1293.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 109.0, 1523.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 756.0, 1507.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 862.0, 1562.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 750.0, 1298.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1621.0, 1427.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 1721.0, 1523.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2096.0, 1414.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2233.0, 1315.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 3095.0, 1400.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2963.0, 1603.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2768.0, 2377.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2588.0, 2229.0));
    add(FrutaWumpa(await loadSprite('Wumpa.png'), 2253.0, 2344.0));
  }
}
