import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:CrashBandicootFlutter/components/player.dart';
import 'package:CrashBandicootFlutter/main_game_page.dart';

import '../home_page_widget.dart';

class GameoverWidget extends StatefulWidget {
  const GameoverWidget({Key? key}) : super(key: key);

  @override
  _GameoverWidgetState createState() => _GameoverWidgetState();
}

class _GameoverWidgetState extends State<GameoverWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    setAudio();
    Player.hasCollidedFinish = false;
  }

  Future<void> setAudio() async {
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('gameover.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF383838),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: const Color(0xFF171616),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-0.77, -0.33),
                  child: Image.asset(
                    'assets/images/gameover3.jpg',
                    width: 400,
                    height: 250,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.7, -1),
                  child: Image.asset(
                    'assets/images/gameover4.png',
                    width: 400,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-6.5, 0.65),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF8B4513),
                              width: 7,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0.05),
                            child: Stack(
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-0.03, 0.8),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 1.5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.805,
                                          height: 78,
                                          decoration: const BoxDecoration(),
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              await audioPlayer.stop();
                                              await Navigator.push<void>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePageWidget(),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    const Color(0xFFCE171A),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    
                                                    side: const BorderSide(
                                                        color:
                                                        // ignore: lines_longer_than_80_chars
                                                            Color.fromARGB(255, 185, 74, 26),
                                                        width: 7.0))),
                                            icon: const Icon(
                                              Icons.exit_to_app_sharp,
                                              color: Color(0xFFEEEEEE),
                                              size: 60.0,
                                            ),
                                            label: const Text(
                                              'EXIT TO MENU',
                                              style: TextStyle(
                                                fontSize: 35,
                                                color: Color(0xFFEEEEEE),
                                                fontFamily: 'Crashito',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.01, -0.98),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 5, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.805,
                                          height: 78,
                                          decoration: const BoxDecoration(),
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              await audioPlayer.stop();
                                              await Navigator.push<void>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MainGamePage(),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    const Color(0xFFFF6522),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: const BorderSide(
                                                        color:
                                                            Color(0xFF1A8308),
                                                        width: 7.0))),
                                            icon: const Icon(
                                              Icons.gamepad_rounded,
                                              color: Color(0xFF00FF00),
                                              size: 60.0,
                                            ),
                                            label: const Text(
                                              'PLAY AGAIN',
                                              style: TextStyle(
                                                fontSize: 40,
                                                color: Color(0xFFEEEEEE),
                                                fontFamily: 'Crashito',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
