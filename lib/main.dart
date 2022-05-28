import 'package:audioplayers/audioplayers.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:CrashBandicootFlutter/gameover/gameover_widget.dart';
import 'home_page_widget.dart';
import 'levelcomplete/levelcomplete_widget.dart';
import 'main_game_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  runApp(const App());
 
}


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crash',
      home: HomePageWidget(),
      //navigatorKey: navigatorKey,
    );
  }
}
