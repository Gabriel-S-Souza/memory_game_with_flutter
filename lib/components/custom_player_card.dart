import 'package:flutter/material.dart';
import 'package:memory_game/controller/game_controller.dart';

class CustomPlayerCard extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final int totalOfPairs;

  const CustomPlayerCard(
      {Key? key,
      required this.name,
      required this.width,
      required this.height,
      required this.totalOfPairs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameControler = GameController.of(context);

    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${gameControler!.victorys}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6),
                        ),
                      ),
                      Icon(
                        Icons.emoji_events,
                        size: 20,
                        color: Theme.of(context).colorScheme.surface,
                      )
                    ],
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.06),
            height: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${gameControler.score}/${gameControler.totalOfPairs}',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 6,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: gameControler.score / 8,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.surfaceVariant),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
