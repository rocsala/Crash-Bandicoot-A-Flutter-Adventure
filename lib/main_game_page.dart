import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'helpers/joypad.dart';
import 'home_page_widget.dart';
import 'ray_world_game.dart';
import 'components/player.dart';
import 'package:CrashBandicootFlutter/levelcomplete/levelcomplete_widget.dart';
import 'gameover/gameover_widget.dart';
import 'dart:async';

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  final audioPlayer = AudioPlayer();
  //int wumpa_counter = Player.Wumpas;
  //String wumpa_text = '';
  //Timer? timer;

  //void handleTimeout() {
  //  setState(() {});
  //}

/*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: lines_longer_than_80_chars
  }
  */

  @override
  Widget build(BuildContext context) {
    RayWorldGame game = RayWorldGame(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
            body: Stack(
              children: [
                GameWidget(game: game),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(200, 690, 0, 0),
                    child: Joypad(
                        onDirectionChanged: game.onJoypadDirectionChanged),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(125, 480, 0, 0),
                    child: Visibility(
                      visible: true,
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFFF6522),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color(0xFFCE171A), width: 4.0))),
                            child: const Text(
                              'INFO',
                              style: TextStyle(
                                fontSize: 32,
                                color: Color(0xFFEEEEEE),
                                fontFamily: 'Crashito',
                              ),
                            ),
                            onPressed: () async {
                              //Player.hasCollidedFinish = false;
                              if (Player.hasCollidedFinish) {
                                await Player.audioPlayer.stop();
                                Player.hasCollidedFinish = false;
                                await Navigator.push<void>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LevelcompleteWidget(),
                                  ),
                                );
                              } else {
                                return showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    backgroundColor: const Color.fromARGB(
                                        203, 248, 248, 248),
                                    title: const Text(
                                      'Level 01 : Turtle Woods',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xFFFF6522),
                                        fontFamily: 'Crashito',
                                      ),
                                    ),
                                    content: const Text(
                                      // ignore: lines_longer_than_80_chars
                                      'Help Crash to find the Finish Portal to complete this level. Hint : Collect Wumpa fruits. 5 Nitro collision = Game Over',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xFFFF6522),
                                        fontFamily: 'Crashito',
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text(
                                          "Let's go!",
                                          style: TextStyle(
                                            fontSize: 35,
                                            // ignore: lines_longer_than_80_chars
                                            color: Color.fromARGB(
                                                255, 14, 49, 219),
                                            fontFamily: 'Crashito',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            )
            );
  }
}
