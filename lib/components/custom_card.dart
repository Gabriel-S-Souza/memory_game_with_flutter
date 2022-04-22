import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_game/controller/game_controller.dart';

import 'custom_cards_list.dart';

class CustomCard extends StatefulWidget {
  final String pathImage;
  final int index;
  final void Function(String path, int index) onTap;
  final bool isMatched;
  final GameStatus gameStatus;
  final void Function(GameStatus) updateGameStatus;
  const CustomCard({
    Key? key,
    required this.pathImage,
    required this.index,
    required this.onTap,
    required this.isMatched, 
    required this.gameStatus, 
    required this.updateGameStatus,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  bool isFlipped = false;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void flip() {
    _animation.forward();
  }

  void backFlip() {
    _animation.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final gameController = GameController.of(context);
    print(gameController?.lastAttemptWasMatch);

    if (!gameController!.matchedCards.contains(widget.index) 
        && widget.gameStatus == GameStatus.secondCardSelected) {
      if (!gameController.lastAttemptWasMatch || gameController.score == gameController.numberOfCards/2) {
        Future.delayed(const Duration(milliseconds: 1300), () {
          backFlip();
          isFlipped = false;
          widget.updateGameStatus(GameStatus.noCardSelected);
        });
      } else {
        Future.delayed(const Duration(milliseconds: 200), () {
          backFlip();
          isFlipped = false;
          widget.updateGameStatus(GameStatus.noCardSelected);
        });
      }
    }

    return GestureDetector(
      onTap: () {
        if (!widget.isMatched && !isFlipped && widget.gameStatus != GameStatus.secondCardSelected) {
          flip();
          widget.onTap(widget.pathImage, widget.index);
          isFlipped = true;
          widget.gameStatus == GameStatus.firstCardSelected
              ? widget.updateGameStatus(GameStatus.secondCardSelected)
              : widget.updateGameStatus(GameStatus.firstCardSelected);
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final double invertValue = 1 - _animation.value;
          final double angle = invertValue * pi;
          bool flipped = angle < 0.5 * pi;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    stops: const [0.0, 1],
                    transform: const GradientRotation(20),
                    colors: flipped
                        //TODO: Simplificar o chaveamento de cores
                        ? [
                            Theme.of(context).colorScheme.primaryContainer,
                            Theme.of(context).colorScheme.primaryContainer,
                          ]
                        : [
                            Theme.of(context).colorScheme.onSurface,
                            Theme.of(context).colorScheme.secondary,
                          ],
                  ),
                  boxShadow: flipped
                      //TODO: Simplificar o chaveamento de sombra
                      ? [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.25),
                            blurRadius: 2,
                            offset: const Offset(2, 2),
                          ),
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.25),
                            blurRadius: 8,
                            offset: const Offset(4, 4),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.25),
                            blurRadius: 2,
                            offset: const Offset(2, 2),
                          ),
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.25),
                            blurRadius: 8,
                            offset: const Offset(-4, 4),
                          ),
                        ],
                ),
                child: _getChild(flipped)),
          );
        },
      ),
    );
  }

  Widget _getChild(bool flipped) {
    if (flipped) {
      return Image.asset(widget.pathImage);
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.inverted(Matrix4.rotationY(pi)),
        child: Icon(
          Icons.question_mark,
          color: Theme.of(context).colorScheme.onPrimary,
          size: MediaQuery.of(context).size.width * 0.15,
        ),
      );
    }
  }
}
