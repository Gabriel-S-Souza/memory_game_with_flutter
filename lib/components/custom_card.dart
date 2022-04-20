import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/controller/game_controller.dart';

class CustomCard extends StatefulWidget {
  final String pathImage;
  final int index;
  const CustomCard({
    Key? key,
    required this.pathImage,
    required this.index,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  bool disable = false;
  CardStatus status = CardStatus.defaultStatus;
  late final AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    audioCache = AudioCache(prefix: 'assets/audio/');
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

    //Validação da primeira carta após a segunda carta ser clicada
    if (status == CardStatus.awaitingValidation && gameControler!.notifier!.value == GameStatus.secondCardFlipped) {
      print('Awaiting validation');
      if (gameControler.validateFirstCardMatch(widget.index)) {
        status = CardStatus.matched;
      } else {
        Future.delayed(const Duration(milliseconds: 1300), () {
          print('Delayed');
          backFlip();
          disable = false;
          status = CardStatus.defaultStatus;
        });
      }
    }

    //backflip da segunda carta clicada que não deu match com a primeira 
    if (status == CardStatus.noMatched) {
      Future.delayed(const Duration(milliseconds: 1300), () {
        backFlip();
        disable = false;
        status = CardStatus.defaultStatus;
      });
    }

    //Habilitação instantânea da carta após um match, ou habilitação com delay para esperar o backflip
    if (status == CardStatus.defaultStatus && gameControler!.lastAttemptWasMatch) {
        disable = true;
    } else if (status == CardStatus.defaultStatus && !gameControler!.lastAttemptWasMatch) {
      Future.delayed(const Duration(milliseconds: 1300), () {
        disable = false;
      });
    }

    //Animação do fim da partida: backflip das cartas com delay de uma para outra
    if (status == CardStatus.matched && gameControler!.notifier!.value == GameStatus.resetGame) {
      Future.delayed(Duration(milliseconds: 1300 + (widget.index * 40)), () {
        backFlip();
        disable = false;
        status == CardStatus.defaultStatus;
      });
    }

    return GestureDetector(
      onTap: () {
        print(gameControler?.disableCards);
        print(gameControler?.notifier!.value);
        if (!gameControler!.disableCards.contains(widget.index)
             && !(gameControler.notifier?.value == GameStatus.awaitingBackflipAnimation)) {
          flip();
          disable = true;
          if (gameControler.doublePlayNumber == 1) {
            gameControler.addFirstCardId(widget.pathImage, widget.index);
            status = CardStatus.awaitingValidation;
          } else {
            if (gameControler.validateMatch(widget.pathImage, widget.index)) {
              status = CardStatus.matched;
              gameControler.setScore();
              audioCache.play('notific-simple.wav');
            } else {
              status = CardStatus.noMatched;
            }
          }
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

enum CardStatus {
  defaultStatus,
  awaitingValidation,
  matched,
  noMatched,
}
