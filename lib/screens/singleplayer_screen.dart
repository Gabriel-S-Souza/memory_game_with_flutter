import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_background_painter.dart';
import 'package:memory_game/models/game_theme.dart';

import '../components/custom_player_card.dart';

class SinglePlayerScreen extends StatelessWidget {
  static const routeName = '/singleplayer';

  const SinglePlayerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final GameTheme arguments = ModalRoute.of(context)?.settings.arguments as GameTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.075,
            height: height * 0.78,
            child: CustomBackgroungImage(width: width)
          ),
          CustomPlayerCard(name: 'Player 1'),
        ],
      ),
    );
  }
}