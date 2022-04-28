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
  bool isCurrentPlayer = false;
  bool isDisable = false;
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
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameController = GameController.of(context);
    
    if (gameController!.isMultplayer) {
      if (gameController.currentPlayer == playerNumber) {
        Future.delayed(const Duration(milliseconds: 1400), () {
          if (mounted) {
            setState(() {
              isCurrentPlayer = true;
              isDisable = false;
              animationController.forward();
            }); 
          }
        });
    } else {
      Future.delayed(const Duration(milliseconds: 1400), () {
        if (mounted) {
          setState(() {
            isCurrentPlayer = false;
            isDisable = true;
            animationController.reverse();
          }); 
        }
      });
    }
    }  

    final score = widget.playerNumber == 1
        ? gameController.score
        : gameController.score2;

    final victorys = widget.playerNumber == 1
        ? gameController.victorys
        : gameController.victorys2;

    Color backgroundColor = isDisable 
        ? Theme.of(context).colorScheme.onTertiary
        : Theme.of(context).colorScheme.primaryContainer;

    return AnimatedBuilder(
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
                      backgroundColor,
                      Theme.of(context).colorScheme.surfaceVariant, 
                    ]
                    : [
                      Theme.of(context).colorScheme.surfaceVariant,
                      backgroundColor,
                      ],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: !isDisable
                ?  [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
            
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
                        color: isDisable
                            ? Theme.of(context).colorScheme.tertiary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${victorys}',
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
                        '$score/${(gameController.numberOfCards/2).floor()}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 7,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: score / (gameController.numberOfCards / 2).floor(),
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
    );
  }
}
