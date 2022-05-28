import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:CrashBandicootFlutter/components/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:CrashBandicootFlutter/home_page_widget.dart';
import 'package:CrashBandicootFlutter/levelcomplete/levelcomplete_widget.dart';
import '../gameover/gameover_widget.dart';
import 'direction.dart';
import 'package:CrashBandicootFlutter/components/player.dart';

class Joypad extends StatefulWidget {
  final ValueChanged<Direction>? onDirectionChanged;
  const Joypad({Key? key, this.onDirectionChanged}) : super(key: key);

  @override
  JoypadState createState() => JoypadState();
}

class JoypadState extends State<Joypad> {
  Direction direction = Direction.none;
  Offset delta = Offset.zero;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            height: 140,
            width: 145,
            child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(193, 241, 50, 7),
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Center(
                    child: Transform.translate(
                      offset: delta,
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(204, 11, 61, 211),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                onPanDown: onDragDown,
                onPanUpdate: onDragUpdate,
                onPanEnd: onDragEnd,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateDelta(Offset newDelta) {
    final newDirection = getDirectionFromOffset(newDelta);

    if (newDirection != direction) {
      direction = newDirection;
      widget.onDirectionChanged!(direction);
    }

    setState(() {
      delta = newDelta;
    });
  }

  Direction getDirectionFromOffset(Offset offset) {
    if (offset.dx > 20) {
      return Direction.right;
    } else if (offset.dx < -20) {
      return Direction.left;
    } else if (offset.dy > 20) {
      return Direction.down;
    } else if (offset.dy < -20) {
      return Direction.up;
    }
    return Direction.none;
  }

  void onDragDown(DragDownDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }

  void calculateDelta(Offset offset) {
    final newDelta = offset - const Offset(60, 60);
    updateDelta(
      Offset.fromDirection(
        newDelta.direction,
        min(30, newDelta.distance),
      ),
    );
  }
}
