import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_background_painter.dart';
import 'package:memory_game/components/custom_cards_list.dart';
import 'package:memory_game/components/custom_timer.dart';
import 'package:memory_game/controllers/game_controller.dart';
import 'package:memory_game/models/game_model.dart';
import 'package:memory_game/repositories/record_time_repository.dart';

import '../components/custom_player_card.dart';

class SinglePlayerScreen extends StatefulWidget {
  static const routeName = '/singleplayer';

  const SinglePlayerScreen({Key? key}) : super(key: key);

  @override
  State<SinglePlayerScreen> createState() => _SinglePlayerScreenState();
}

class _SinglePlayerScreenState extends State<SinglePlayerScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double paddingHorizontal = width * 0.04;

    final GameModel gameModel =
        ModalRoute.of(context)?.settings.arguments as GameModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GameController(
        recordBox: RecordTimeRepository.getRecordTime(),
        isMultplayer: false,
        gameModel: gameModel,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: kToolbarHeight),
              child: CustomBackgroungImage(width: width),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPlayerCard(
                          name: 'Player 1',
                          height: MediaQuery.of(context).size.height * 0.095,
                          width: MediaQuery.of(context).size.width * 0.44,
                          playerNumber: 1,
                        ),
                        CustomTimer(
                          height: MediaQuery.of(context).size.height * 0.095,
                          width: MediaQuery.of(context).size.width * 0.4,
                          themeName: gameModel.themeName,
                        ),
                      ],
                    ),
                  ),
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
