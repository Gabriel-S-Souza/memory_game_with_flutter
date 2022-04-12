import 'package:flutter/material.dart';
import 'package:memory_game/models/game_theme.dart';

class SinglePlayerScreen extends StatelessWidget {
  static const routeName = '/singleplayer';

  const SinglePlayerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameTheme arguments = ModalRoute.of(context)?.settings.arguments as GameTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Single Player Mode'),
      ),
      body: Center(
        child: Text(arguments.themeName),
      ),
    );
  }
}