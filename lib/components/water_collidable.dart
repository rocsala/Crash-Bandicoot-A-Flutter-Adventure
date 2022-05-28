
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class WaterCollidable extends PositionComponent
    with HasGameRef, Hitbox, Collidable {
  WaterCollidable() {
    addHitbox(HitboxRectangle());
  }
}
