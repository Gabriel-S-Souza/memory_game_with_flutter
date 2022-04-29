import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_card.dart';
import 'package:memory_game/components/custom_info_banner.dart';
import 'package:memory_game/components/custom_modal.dart';
import 'package:memory_game/controllers/game_controller.dart';
import 'package:memory_game/models/game_model.dart';

import '../tools/page_modal.dart';

class CustomCardsList extends StatefulWidget {
  final GameModel gameModel;
  final double padding;
  const CustomCardsList(
      {Key? key, required this.gameModel, required this.padding})
      : super(key: key);

  @override
  State<CustomCardsList> createState() => _CustomCardsListState();
}

class _CustomCardsListState extends State<CustomCardsList> {
  late final GameModel _gameModel = widget.gameModel;
  List<String>? _shuffledImagePaths;
  List<Map<String, dynamic>> flippedCards = [];
  GameStatus gameStatus = GameStatus.noCardSelected;
  bool firstRound = true;
  bool testRecord = true;

  @override
  void initState() {
    super.initState();
    _shuffledImagePaths = _shuffleImagePaths(_gameModel.getImagesPath());
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> _shuffleImagePaths(List<String> imagePaths) {
    imagePaths.shuffle();
    return imagePaths;
  }

  void _showInfoBanner(GameController gameController, context) {
    final String initialPlayer = gameController.currentPlayer == 1
        ? _gameModel.playerNames[0]
        : _gameModel.playerNames[1];
    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.of(context).push(ModalPage(
        duration: const Duration(milliseconds: 1000),
        autoDispose: true,
        myBarrierDismissible: false,
        bottomSlideTransiction: false,
        builder: (context) => CustomInfoBanner(
          width: MediaQuery.of(context).size.width,
          message: '$initialPlayer começa',
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameController = GameController.of(context);

    if (gameController!.isMultplayer &&
        gameController.attemptNumber == 0 &&
        flippedCards.isEmpty &&
        firstRound) {
      _showInfoBanner(gameController, context);
    }
    firstRound = false;

    return LayoutBuilder(builder: (context, constraints) {
      double heightFraction;
      double widthFraction;

      if (constraints.maxHeight * 0.85 >= constraints.maxWidth) {
        widthFraction = 2;
        heightFraction = 2.5;
      } else if (constraints.maxHeight * 0.90 >= constraints.maxWidth) {
        widthFraction = 2;
        heightFraction = 2.42;
      } else if (constraints.maxHeight * 0.95 >= constraints.maxWidth) {
        widthFraction = 2;
        heightFraction = 2.38;
      } else if (constraints.maxHeight * 1.15 >= constraints.maxWidth) {
        widthFraction = 2;
        heightFraction = 2.2;
      } else {
        widthFraction = constraints.maxHeight;
        heightFraction = constraints.maxWidth;
      }

      return GridView.count(
        padding: EdgeInsets.only(left: widget.padding, right: widget.padding),
        shrinkWrap: true,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        crossAxisCount: 4,
        mainAxisSpacing: widget.padding,
        crossAxisSpacing: widget.padding,
        childAspectRatio: widthFraction / heightFraction,
        children: List.generate(_gameModel.numberOfPairs * 2, (index) {
          return CustomCard(
            pathImage: _shuffledImagePaths![index],
            index: index,
            isMatched: gameController.matchedCards.contains(index),
            gameStatus: gameStatus,
            onTap: (path, index) {
              if (flippedCards.isEmpty) {
                flippedCards.add({'path': path, 'index': index});
              } else if (flippedCards.length == 1) {
                flippedCards.add({'path': path, 'index': index});
                gameController.validateMatch(flippedCards);
                flippedCards = [];
              }

              if (gameController.matchedCards.length ==
                  gameController.numberOfCards) {
                if (gameController.isMultplayer) {
                  if (gameController.score > gameController.score2) {
                    Navigator.of(context)
                        .push(ModalPage(
                      myBarrierColor: Colors.black.withOpacity(0.5),
                      builder: (context) {
                        return CustomModal(
                          title: '${_gameModel.playerNames[0]} venceu!!!',
                          child: Image.asset(
                            'assets/images/trophy.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ))
                        .then((value) {
                      _shuffledImagePaths =
                          _shuffleImagePaths(_gameModel.getImagesPath());
                      gameController.notifier!.value++;
                      _showInfoBanner(gameController, context);
                    });
                  } else if (gameController.score < gameController.score2) {
                    Navigator.of(context)
                        .push(ModalPage(
                      myBarrierColor: Colors.black.withOpacity(0.5),
                      builder: (context) {
                        return CustomModal(
                          title: '${_gameModel.playerNames[1]} venceu!!!',
                          child: Image.asset(
                            'assets/images/trophy.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ))
                        .then((value) {
                      _shuffledImagePaths =
                          _shuffleImagePaths(_gameModel.getImagesPath());
                      gameController.notifier!.value++;
                      _showInfoBanner(gameController, context);
                    });
                  } else {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      _shuffledImagePaths =
                          _shuffleImagePaths(_gameModel.getImagesPath());
                      gameController.notifier!.value++;
                      _showInfoBanner(gameController, context);
                    });
                  }
                } else {
                  Navigator.of(context)
                      .push(ModalPage(
                    myBarrierColor: Colors.black.withOpacity(0.5),
                    builder: (context) {
                      return CustomModal(
                        title: gameController.lastGameWasRecord
                            ? 'UAAAU!'
                            : 'YEEEEEEAH!',
                        subtitle: gameController.lastGameWasRecord
                            ? 'Novo record:'
                            : 'Tempo:',
                        showConffetti: gameController.lastGameWasRecord,
                        secondSubtitle: gameController.time,
                        child: Image.asset(
                          gameController.lastGameWasRecord
                              ? 'assets/images/trophy-record.png'
                              : 'assets/images/trophy.png',
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ))
                      .then((value) {
                    _shuffledImagePaths =
                        _shuffleImagePaths(_gameModel.getImagesPath());
                    gameController.notifier!.value++;
                  });
                }
              }
            },
            updateGameStatus: (status) {
              setState(() {
                gameStatus = status;
              });
            },
          );
        }),
      );
    });
  }
}

enum GameStatus {
  noCardSelected,
  firstCardSelected,
  secondCardSelected,
}
