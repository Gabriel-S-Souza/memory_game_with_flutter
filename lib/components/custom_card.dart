import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memory_game/controller/card_controller.dart';
import 'package:memory_game/controller/game_controller.dart';

class CustomCard extends StatefulWidget {
  final String pathImage;
  final Function(String) onTap;
  final CardController cardController;
  const CustomCard(
      {Key? key,
      required this.pathImage,
      required this.onTap,
      required this.cardController})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  bool disable = false;
  bool matched = false;
  bool secondCardFlipped = false;
  bool firstCardFlipped = false;

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
    widget.cardController.flipCard();
    _animation.forward();
  }

  void backFlip() {
    widget.cardController.flipCard();
    _animation.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final gameControler = GameController.of(context);

    if(matched == false && secondCardFlipped == true) {
      Future.delayed(const Duration(milliseconds: 1400), () {
        backFlip();
        disable = false;
        secondCardFlipped = false;
      });
    }
    if (firstCardFlipped && gameControler!.attemptNumber == 2) {
      if (gameControler.secondCardFlippedId == widget.pathImage) {
        matched = true;
      } else {
        Future.delayed(const Duration(milliseconds: 1400), () {
          backFlip();
          disable = false;
          firstCardFlipped = false;
        });
      }
    }

    return AnimatedBuilder(
      animation: widget.cardController,
      builder: (context, _) {
        return GestureDetector(
          onTap: () {
            print(gameControler!.attemptNumber);
            if (disable) {
              return;
            } else {
              flip();
              if (gameControler.attemptNumber == 1) {
                gameControler.addFirstCardId(widget.pathImage);
                disable = true;
                firstCardFlipped = true;
              } else {
                if (gameControler.validateMatch(widget.pathImage)) {
                  matched = true;
                  secondCardFlipped = true;
                  disable = true;
                } else {
                  disable = true;
                  secondCardFlipped = true;
                }
              }
              gameControler.changeAttemptNumber();
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
        );
      },
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
