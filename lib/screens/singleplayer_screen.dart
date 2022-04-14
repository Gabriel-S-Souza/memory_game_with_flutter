import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_background_painter.dart';
import 'package:memory_game/components/custom_cards_list.dart';
import 'package:memory_game/components/custom_timer.dart';
import 'package:memory_game/models/game_theme.dart';

import '../components/custom_player_card.dart';

class SinglePlayerScreen extends StatefulWidget {
  static const routeName = '/singleplayer';

  const SinglePlayerScreen({ Key? key }) : super(key: key);

  @override
  State<SinglePlayerScreen> createState() => _SinglePlayerScreenState();
}

class _SinglePlayerScreenState extends State<SinglePlayerScreen> {
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
          Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            child: CustomBackgroungImage(width: width),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomPlayerCard(
                      name: 'Player 1',
                      height: MediaQuery.of(context).size.height * 0.095,
                      width: MediaQuery.of(context).size.width * 0.44,
                      score: 4,
                      totalOfPairs: 8,
                      victoriesNumber: 2,
                    ),
                    CustomTimer(
                      height: MediaQuery.of(context).size.height * 0.095,
                      width:  MediaQuery.of(context).size.width * 0.44, 
                      record: '00:00',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin:EdgeInsets.fromLTRB(0, height * 0.18, 0, 0),
            height: height * 0.6,
            width: width,
            child: const CustomCardsList()
          ),
        ],
      ),
    );
  }
}