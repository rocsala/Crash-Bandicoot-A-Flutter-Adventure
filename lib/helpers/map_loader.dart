import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MapLoader {
  static Future<List<Rect>> readRayWorldCollisionMap() async {
    final collidableRects = <Rect>[];
    final dynamic collisionMap =
        //json.decode(await rootBundle.loadString('assets/CollisionCrash.json'));
json.decode(await rootBundle.loadString('assets/CollisionCrash.json'));
    for (final dynamic data in collisionMap['objects']) {
      collidableRects.add(Rect.fromLTWH(
          data['x'] as double,
          data['y'] as double,
          data['width'] as double,
          data['height'] as double));
    }
    return collidableRects;
  }
}

class WaterLoader {
  static Future<List<Rect>> readRayWorldCollisionWater() async {
    final collidableRects = <Rect>[];
    final dynamic collisionWater =
        json.decode(await rootBundle.loadString('assets/aiguamortal.json'));

    for (final dynamic data in collisionWater['objects']) {
      collidableRects.add(Rect.fromLTWH(
          data['x'] as double,
          data['y'] as double,
          data['width'] as double,
          data['height'] as double));
    }
    return collidableRects;
  }
}
