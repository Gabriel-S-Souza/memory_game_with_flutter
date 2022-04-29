import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_player_card_to_multiplayer.dart';
import 'package:memory_game/controllers/game_controller.dart';
import 'package:memory_game/models/game_model.dart';

import '../components/custom_background_painter.dart';
import '../components/custom_cards_list.dart';
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
    double paddingHorizontal = width * 0.04;

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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: CustomPlayerCardToMultplayer(padding: paddingHorizontal),
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.loose,
                  child: FractionallySizedBox(
                    heightFactor: 0.92,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: CustomCardsList(
                        gameModel: gameModel,
                        padding: paddingHorizontal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}