import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:CrashBandicootFlutter/components/player.dart';
import 'package:CrashBandicootFlutter/main_game_page.dart';

import '../home_page_widget.dart';

class LevelcompleteWidget extends StatefulWidget {
  const LevelcompleteWidget({Key? key}) : super(key: key);

  @override
  _LevelcompleteWidgetState createState() => _LevelcompleteWidgetState();
}

class _LevelcompleteWidgetState extends State<LevelcompleteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    Player.hasCollidedFinish = false;
    super.initState();
    setAudio();
  }

  Future<void> setAudio() async {
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('final.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
    await audioPlayer.resume();
    //audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: const Color(0xFF171616),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: Image.asset(
                  'assets/images/levelcomplete.jpg',
                ).image,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Stack(
              children: [
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
                              color: const Color(0xFFFF4500),
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
                                              Player.hasCollidedFinish = false;
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
                                                            Color(0xFFFF6522),
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
                                              Player.hasCollidedFinish = false;
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
                                                 // ignore: lines_longer_than_80_chars
                                                    Color.fromARGB(255, 185, 74, 26),
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
          Align(
            alignment: const AlignmentDirectional(0, -1),
            child: Container(
              width: 400,
              height: 100,
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'CONGRATULATIONS!',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xFF00FF00),
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -0.85),
            child: Container(
              width: 400,
              height: 100,
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LEVEL COMPLETE!',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xFF00FF00),
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
           Align(
                  alignment: const AlignmentDirectional(0, -0.68),
                  child: Container(
                    width: 400,
                    height: 40,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 10, 0),
                          child: Image.asset(
                            'assets/images/life.png',
                            width: 40,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const Text(
                          'Lives : ',
                          style: TextStyle(
                            fontFamily: 'Crashito',
                            //color: Color(0xFFFF4500),
                            color: Color(0xFF00FF00),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                           Text(
                            '${Player.lifes.toString()}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF00FF00),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        //),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Image.asset(
                            'assets/images/Wumpa.png',
                            width: 40,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const Text(
                          'Wumpas : ',
                          style: TextStyle(
                            fontFamily: 'Crashito',
                            color: Color(0xFF00FF00),
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          '${Player.Wumpas.toString()}',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xFF00FF00),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
