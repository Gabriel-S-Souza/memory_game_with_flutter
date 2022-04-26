import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_player_card_to_multiplayer.dart';
import 'package:memory_game/models/game_model.dart';

import '../components/custom_background_painter.dart';
import '../components/custom_cards_list.dart';
import '../components/custom_player_card.dart';
import '../controller/game_controller.dart';
import '../repositories/record_time_repository.dart';
class MultiPlayerScreen extends StatefulWidget {
  static const routeName = '/multiplayer';

  const MultiPlayerScreen({ Key? key }) : super(key: key);

  @override
  State<MultiPlayerScreen> createState() => _MultiPlayerScreenState();
}

class _MultiPlayerScreenState extends State<MultiPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final GameModel gameModel = ModalRoute.of(context)?.settings.arguments as GameModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: GameController(
        recordBox: RecordTimeRepository.getRecordTime(),
        isMultplayer: true,
        gameModel: gameModel,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: kToolbarHeight),
              child: CustomBackgroungImage(width: width),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                children: const [
                  CustomPlayerCardToMultplayer()
                ],
              ),
            ),
            Container(
              margin:EdgeInsets.fromLTRB(0, height * 0.18, 0, 0),
              height: height * 0.6,
              width: width,
              child: CustomCardsList(gameModel: gameModel,)
            ),
          ],
        ),
      ),
    );
  }
}