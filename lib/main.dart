import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memory_game/default_values/game_themes.dart';
import 'package:memory_game/models/record_model.dart';

import 'screens/home_screen.dart';
import 'screens/multiplayer_screen.dart';
import 'screens/singleplayer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(RecordModelAdapter());
  Box<RecordModel> recordBox = await Hive.openBox<RecordModel>('record');
  if (recordBox.get(GameThemes.animals) == null) {
    recordBox.put(GameThemes.animals, RecordModel()
      ..timeString = '--:--'
      ..timeInSeconds = 0);
  }
  if (recordBox.get(GameThemes.landscape) == null) {
    recordBox.put(GameThemes.landscape, RecordModel()
      ..timeString = '--:--'
      ..timeInSeconds = 0);
  }
  if (recordBox.get(GameThemes.dev) == null) {
    recordBox.put(GameThemes.dev, RecordModel()
      ..timeString = '--:--'
      ..timeInSeconds = 0);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF6564db,
            <int, Color>{
              100: Color(0x779a92ff),
              200: Color(0xFF9a92ff),
              400: Color(0xFF2a3aa9),
              700: Color(0xFF2a3aa9),
            },
          ),
          backgroundColor: const Color(0xFFFAF9F9),
        ).copyWith(
          secondary: const Color(0xFF0D1317),
          surface: const Color(0xFFF5DD00),
          shadow: const Color(0x5C000000),
          primaryContainer: const Color(0xFFFFFFFF),
          onPrimary: const Color(0xFFFFFFFF),
          onSecondary: const Color(0xFF393939),
          surfaceVariant: const Color(0xFF31E981),
          onSurface: const Color.fromARGB(255, 85, 85, 85),
          tertiary: const Color(0xFF979797),
          onTertiary: const Color(0xFFE7E6E6),
        ),
        fontFamily: 'ConcertOne',
        textTheme: const TextTheme(
          button: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF),
          ),
        )
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SinglePlayerScreen.routeName: (context) => const SinglePlayerScreen(),
        MultiPlayerScreen.routeName: (context) => const MultiPlayerScreen(),
      },
    );
  }
}

