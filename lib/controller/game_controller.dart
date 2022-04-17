import 'package:flutter/material.dart';

class GameController extends InheritedNotifier<ValueNotifier<int>> {
  GameController({Key? key, required Widget child}) 
      : super(
        key: key, 
        child: child,
        notifier: ValueNotifier(1),
      );

  int currentPlayNumber = 1;
  String? firstCardFlippedId;
  String? secondCardFlippedId;
  bool lastAttemptWasMatch = false;
  int score = 0;
  int victorys = 0;
  int totalOfPairs = 8;

  int get attemptNumber => notifier!.value; 

  void finshAttempt() {
    notifier!.value++;
  }

  void addFirstCardId(String cardId) {
    firstCardFlippedId = cardId;
    currentPlayNumber = 2;
  }

  bool validateMatch(String cardId) {
    currentPlayNumber = 1;
    secondCardFlippedId = cardId;
    if (firstCardFlippedId == cardId) {
      lastAttemptWasMatch = true;
      return true;
    }
    lastAttemptWasMatch = false;
    return false;
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
    notifier!.value = 0;
  }



  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static GameController? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<GameController>();

}


