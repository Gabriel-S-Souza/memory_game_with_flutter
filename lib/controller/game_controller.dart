import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameController extends InheritedNotifier<ValueNotifier<GameStatus>> {
  GameController({Key? key, required Widget child})
      : super(
          key: key,
          child: child,
          notifier: ValueNotifier(GameStatus.beforeFlips),
        );

  int doublePlayNumber = 1;
  Map<String, dynamic> firstCardFlippedId = {
    'path': '',
    'index': 0,
  };
  Map<String, dynamic> secondCardFlippedId = {
    'path': '',
    'index': 0,
  };
  bool lastAttemptWasMatch = false;
  int score = 0;
  int victorys = 0;
  int totalOfPairs = 8;
  bool firstGame = true;
  int numberOfAttempts = 0;
  List<int> disableCards = [];

  GameStatus get attemptNumber => notifier!.value;

  void changeGameStatus(GameStatus status) {
    notifier!.value = status;
    print('attemptNumber: ${notifier!.value}');
    if (notifier!.value == GameStatus.awaitingBackflipAnimation) {
      Future.delayed(const Duration(milliseconds: 1300),
        () => changeGameStatus(GameStatus.beforeFlips));
    }
  }

  void addFirstCardId(String cardId, int index) {
    firstCardFlippedId['path'] = cardId;
    firstCardFlippedId['index'] = index;
    doublePlayNumber = 2;
    changeGameStatus(GameStatus.firstCardFlipped);
  }

  bool validateMatch(String cardId, int index) {
    changeGameStatus(GameStatus.secondCardFlipped);
    Future.delayed(const Duration(milliseconds: 1300),
        () => changeGameStatus(GameStatus.beforeFlips));
    doublePlayNumber = 1;
    numberOfAttempts++;
    secondCardFlippedId['path'] = cardId;
    secondCardFlippedId['index'] = index;
    if (firstCardFlippedId['path'] == cardId && firstCardFlippedId['index'] != index) {
      firstCardFlippedId['path'] = '';
      lastAttemptWasMatch = true;
      disableCards.add(index);
      disableCards.add(firstCardFlippedId['index']);
      return true;
    }
    changeGameStatus(GameStatus.awaitingBackflipAnimation);
    lastAttemptWasMatch = false;
    return false;
  }

  bool validateFirstCardMatch(index) {
    if (disableCards.contains(index)) {
      return true;
    } else {
      return false;
    }
  }

  void setScore() {
    score++;
    if (score == totalOfPairs) {
      victorys++;
      resetScore();
    }
  }

  void resetScore() {
    score = 0;
    firstGame = false;
    numberOfAttempts = 0;
    changeGameStatus(GameStatus.resetGame);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static GameController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GameController>();
}

enum GameStatus {
  beforeFlips,
  firstCardFlipped,
  secondCardFlipped,
  awaitingBackflipAnimation,
  resetGame,
}
