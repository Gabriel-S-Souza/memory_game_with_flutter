import 'package:flutter/material.dart';
import 'package:memory_game/models/game_model.dart';

class MultiPlayerScreen extends StatelessWidget {
  static const routeName = '/multiplayer';

  const MultiPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameModel arguments = ModalRoute.of(context)?.settings.arguments as GameModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Player Mode'),
      ),
      body: Center(
        child: Text(arguments.themeName),
      ),
    );
  }
}
