import 'package:flutter/material.dart';
import 'package:memory_game/controller/game_controller.dart';

class CustomPlayerCard extends StatefulWidget {
  final double width;
  final double height;
  final String name;
  final int playerNumber;

  const CustomPlayerCard({
    Key? key,
    required this.name,
    required this.width,
    required this.height, 
    required this.playerNumber,
  }) : super(key: key);

  @override
  State<CustomPlayerCard> createState() => _CustomPlayerCardState();
}

class _CustomPlayerCardState extends State<CustomPlayerCard> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  bool isCurrentPlayer = true;
  late final int playerNumber;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    playerNumber = widget.playerNumber;
  }

  @override
  Widget build(BuildContext context) {
    final gameController = GameController.of(context);

    return GestureDetector(
      onTap: () => setState(() {
        if (!isCurrentPlayer) {
          isCurrentPlayer = true;
          animationController.forward();
        } else {
          isCurrentPlayer = false;
          animationController.reverse();
        }
        
      }),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            height: widget.height,
            width: widget.width,
            padding: EdgeInsets.fromLTRB(widget.height * 0.1, widget.height * 0.1,widget.height * 0.1, 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: playerNumber == 1
                    ? [1 - (animationController.value *  0.06), 1 - (animationController.value * 0.06)]
                    : [(animationController.value * 0.06),(animationController.value * 0.06)],
                colors: playerNumber == 1
                    ?  [
                        Theme.of(context).colorScheme.primaryContainer,
                        Theme.of(context).colorScheme.surfaceVariant, 
                      ]
                      : [
                        Theme.of(context).colorScheme.surfaceVariant,
                        Theme.of(context).colorScheme.primaryContainer,
                        ],
              ),
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
            child: Padding(
              padding: playerNumber == 1
                  ? EdgeInsets.only(right: widget.width * 0.05 * animationController.value)
                  : EdgeInsets.only(left: widget.width * 0.05 * animationController.value),
                     
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: widget.height * 0.30,
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
                                '${gameController!.victorys}',
                                style: TextStyle(
                                  fontSize: widget.height * 0.26,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.6),
                                ),
                              ),
                              Icon(
                                Icons.emoji_events,
                                size: widget.height * 0.30,
                                color: Theme.of(context).colorScheme.surface,
                              )
                            ],
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: widget.height * 0.06),
                    height: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${gameController.score}/${(gameController.numberOfCards/2).floor()}',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6),
                          ),
                        ),
                        //TODO: Fazer a animação do enchimento do barra de progresso
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 7,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: gameController.score / (gameController.numberOfCards / 2).floor(),
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
            ),
          );
        }
      ),
    );
  }
}
