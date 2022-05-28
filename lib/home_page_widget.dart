import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:CrashBandicootFlutter/components/player.dart';
import 'package:CrashBandicootFlutter/main_game_page.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
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
    final url = await player.load('Menu.mp3');
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    audioPlayer.setUrl(url.path, isLocal: true);
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: Image.asset(
                  'assets/images/mainmenu.jpg',
                ).image,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0.7),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                await audioPlayer.stop();
                                await Navigator.push<void>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainGamePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFFF6522),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color: Color(0xFFCE171A),
                                          width: 7.0)
                                          )
                                          ),
                              icon: const Icon(
                                Icons.gamepad_rounded,
                                color: Color(0xFFEEEEEE),
                                size: 60.0,
                              ),
                              label: const Text(
                                'PLAY',
                                style: TextStyle(
                                  fontSize: 55,
                                  color: Color(0xFFEEEEEE),
                                  fontFamily: 'Crashito',
                                ),
                              )
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.2, -0.565),
                  child: Container(
                    width: 270,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF325ACF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'A FLUTTER ADVENTURE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFEEEEEEE),
                              fontFamily: 'Rubik'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.9, 0.43),
            child: Image.asset(
              'assets/images/flutter-removebg-preview.png',
              width: 130,
              height: 130,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
