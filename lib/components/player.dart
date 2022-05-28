//import 'dart:js';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:CrashBandicootFlutter/home_page_widget.dart';
import '../gameover/gameover_widget.dart';
import '../levelcomplete/levelcomplete_widget.dart';
import 'fruta_wumpa.dart';
import 'nitro.dart';
import 'world_collidable.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';
import 'finish_point.dart';
import 'package:path/path.dart';
import '../main.dart';
import 'water_collidable.dart';
import '../main_game_page.dart';
import '../helpers/joypad.dart';
import '../main.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef, Hitbox, Collidable {
  final double _playerSpeed = 250.0;
  final double _animationSpeed = 0.15;
  static final audioPlayer = AudioPlayer();
  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;

  Direction direction = Direction.none;
  Direction _collisionDirection = Direction.none;
  bool _hasCollided = false;
  static bool hasCollidedFinish = false;
  static bool hasCollidedWater = false;
  static bool hasCollidedNitro = false;
  Direction _WatercollisionDirection = Direction.none;
  static int Wumpas = 0;
  static int lifes = 5;
  BuildContext context;
  Player(this.context)
      : super(
          size: Vector2.all(50.0),
        ) {
    addHitbox(HitboxRectangle());
  }

  Future setAudio() async {
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('monkey.mp3');
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    audioPlayer.setUrl(url.path, isLocal: true);
    await audioPlayer.resume();
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _loadAnimations().then((_) => {animation = _standingAnimation});
    setAudio();
    Player.hasCollidedFinish = false;
    Player.hasCollidedNitro = false;
  }

  //@override
  // void onTapUp() async {
  //   var ap = AudioPlayer();
  //   AudioPlayer.
  // }

// Future<void> main2() async {
//  Flame.audio.play('explosion.mp3');
//   await player.stop();
// }
  @override
  void update(double delta) {
    super.update(delta);
    movePlayer(delta);
    // if (hasCollidedFinish) {
    //   audioPlayer.stop();
    // }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);

    if (other is WorldCollidable) {
      if (!_hasCollided) {
        _hasCollided = true;
        _collisionDirection = direction;
      }
    }
    if (other is WaterCollidable) {
      if (!hasCollidedWater) {
        hasCollidedWater = true;
        _collisionDirection = direction;
      }
    }

    if (other is Finish) {
      other.removeFromParent();
      if (!hasCollidedFinish) {
          Player.audioPlayer.stop();
        hasCollidedFinish = true;
        _collisionDirection = direction;
        Navigator.push<void>(
          context,
          MaterialPageRoute(builder: (context) => const LevelcompleteWidget()),
        );
      }
    }

    if (other is Finish) {
      //other.removeFromParent();
      Player.hasCollidedFinish = true;
    }

    if (other is FrutaWumpa) {
      other.removeFromParent();
      Wumpas++;

      print(Wumpas.toString() + ' ' + 'Wumpas collected');
    }

    if (other is Nitro) {
      lifes--;
      other.removeFromParent();
      print(lifes);
      if (lifes == 0) {
      Player.audioPlayer.stop();
        print(lifes.toString() + ' ' + 'GAME OVER');
        Navigator.push<void>(
          context,
          MaterialPageRoute(builder: (context) => const GameoverWidget()),
        );
      }
      _collisionDirection = direction;
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    _hasCollided = false;
    hasCollidedWater = false;
  }

  @override
  void onCollisionFinishEnd(Collidable other) {
    hasCollidedFinish = false;
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('crashdef4.png'),
      srcSize: Vector2(52.0, 79.0),
    );

    _runDownAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);

    _runLeftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 4);

    _runUpAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 4);

    _runRightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 4);

    _standingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.up:
        if (canPlayerMoveUp()) {
          animation = _runUpAnimation;
          moveUp(delta);
        }
        break;
      case Direction.down:
        if (canPlayerMoveDown()) {
          animation = _runDownAnimation;
          moveDown(delta);
        }
        break;
      case Direction.left:
        if (canPlayerMoveLeft()) {
          animation = _runLeftAnimation;
          moveLeft(delta);
        }
        break;
      case Direction.right:
        if (canPlayerMoveRight()) {
          animation = _runRightAnimation;
          moveRight(delta);
        }
        break;
      case Direction.none:
        animation = _standingAnimation;
        break;
    }
  }

  bool canPlayerMoveUp() {
    if (_hasCollided && _collisionDirection == Direction.up ||
        hasCollidedWater && _collisionDirection == Direction.up) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveDown() {
    if (_hasCollided && _collisionDirection == Direction.down ||
        hasCollidedWater && _collisionDirection == Direction.down) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveLeft() {
    if (_hasCollided && _collisionDirection == Direction.left ||
        hasCollidedWater && _collisionDirection == Direction.left) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveRight() {
    if (_hasCollided && _collisionDirection == Direction.right ||
        hasCollidedWater && _collisionDirection == Direction.right) {
      return false;
    }
    return true;
  }

  void moveUp(double delta) {
    position.add(Vector2(0, delta * -_playerSpeed));
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * _playerSpeed));
  }

  void moveLeft(double delta) {
    position.add(Vector2(delta * -_playerSpeed, 0));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * _playerSpeed, 0));
  }
}
