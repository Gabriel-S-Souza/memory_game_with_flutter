import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          accentColor: const Color(0xFF31E981),
          backgroundColor: const Color(0xFFFAF9F9),
        ).copyWith(
          secondary: const Color(0xFF0D1317),
          surface: const Color(0xFFF5DD00),
        )
      ),
    );
  }
}

