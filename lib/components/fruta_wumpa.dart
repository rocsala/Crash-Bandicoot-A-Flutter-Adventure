import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'world_collidable.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';

class FrutaWumpa extends SpriteComponent with Hitbox, Collidable {
  final audioPlayer = AudioPlayer();
  FrutaWumpa(Sprite sprite, double x, double y) {
    this.sprite = sprite;
    size = Vector2(30.0, 30.0);
    anchor = Anchor.center;
    position = Vector2(x, y);
    addHitbox(HitboxRectangle());
  }
}
