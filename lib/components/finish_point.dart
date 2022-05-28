import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'world_collidable.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';

class Finish extends SpriteComponent with Hitbox, Collidable {
  final audioPlayer = AudioPlayer();
  Finish(Sprite sprite) {
    this.sprite = sprite;
    size = Vector2(90.0, 90.0);
    anchor = Anchor.center;
    position = Vector2(1750.0, 2300.0);
    addHitbox(HitboxRectangle());
  }
}
