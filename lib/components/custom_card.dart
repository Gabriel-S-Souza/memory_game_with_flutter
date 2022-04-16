import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_game/controller/game_controller.dart';

class CustomCard extends StatefulWidget {
  final String pathImage;
  const CustomCard(
      {Key? key, required this.pathImage,}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  bool disable = false;
  CardStatus status = CardStatus.defaultStatus;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
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
    final gameControler = GameController.of(context);

    if (status == CardStatus.awaitingValidation) {
      if (gameControler!.secondCardFlippedId == widget.pathImage) {
        status = CardStatus.matched;
      } else {
        Future.delayed(const Duration(milliseconds: 1400), () {
          backFlip();
          disable = false;
          status = CardStatus.defaultStatus;
        });
      }
    }
    if (status == CardStatus.noMatched) {
      Future.delayed(const Duration(milliseconds: 1400), () {
        backFlip();
        disable = false;
        status = CardStatus.defaultStatus;
      });
    }
    if (status == CardStatus.defaultStatus && gameControler!.currentPlayNumber == 1) {
      disable = true;
      Future.delayed(const Duration(milliseconds: 1400), () {
        disable = false;
      });
    }

    return Container(
        child: GestureDetector(
          onTap: () {
            if (disable) {
              return;
            } else {
              flip();
              if (gameControler!.currentPlayNumber == 1) {
                gameControler.addFirstCardId(widget.pathImage);
                disable = true;
                status = CardStatus.awaitingValidation;
              } else {
                if (gameControler.validateMatch(widget.pathImage)) {
                  disable = true;
                  status = CardStatus.matched;
                } else {
                  disable = true;
                  status = CardStatus.noMatched;
                }
                gameControler.finshAttempt();
              }
            }
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final double invertValue = 1 - _animation.value;
              final double angle = invertValue * pi;
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(angle),
                alignment: Alignment.center,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.4),
                          blurRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(4, 4),
                        ),
                      ],
                      gradient: LinearGradient(
                          stops: const [0.0, 1],
                          transform: const GradientRotation(20),
                          colors: angle < 0.5 * pi
                              ? [
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ]
                              : [
                                  Theme.of(context).colorScheme.onSurface,
                                  Theme.of(context).colorScheme.secondary,
                                ]),
                    ),
                    child: _getChild(angle)),
              );
            },
          ),
        ),
    );
  }

  Widget _getChild(double angle) {
    if (angle < 0.5 * pi) {
      return _getBackCard();
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

  Widget _getBackCard() {
    return Image.asset(widget.pathImage);
  }
}

enum CardStatus {
  defaultStatus,
  awaitingValidation,
  matched,
  noMatched,
}
