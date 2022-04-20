import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameController extends InheritedNotifier<ValueNotifier<int>> {
  GameController({Key? key, required Widget child})
      : super(
          key: key,
          child: child,
          notifier: ValueNotifier(0),
        );

  List<int> matchedCards = [];

  int get attemptNumber => notifier!.value;

  void _attemptPass() {
    notifier!.value++;
  }

  void validateMatch(List<Map<String, dynamic>> cards) {
    if (cards.length == 2) {
      if (cards[0]['path'] == cards[1]['path']) {
        matchedCards.add(cards[0]['index']);
        matchedCards.add(cards[1]['index']);
      }
      _attemptPass();
    } else {
      throw Exception('Invalid number of cards');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static GameController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GameController>();
}

// enum GameStatus {
//   beforeFlips,
//   firstCardFlipped,
//   secondCardFlipped,
//   awaitingBackflipAnimation,
//   resetGame,
// }
