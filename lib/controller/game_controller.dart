import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/models/game_model.dart';

// ignore: must_be_immutable
class GameController extends InheritedNotifier<ValueNotifier<int>> {
  final int numberOfCards;
  final GameModel gameModel;
  final bool isMultplayer;
  GameController({
    Key? key, required Widget child,
    this.numberOfCards = 16,
    required this.gameModel,
    required this.isMultplayer,
   })
      : super(
          key: key,
          child: child,
          notifier: ValueNotifier(0),
        );
  final AudioCache audioCache = AudioCache(prefix: 'assets/audio/');
  int? currentPlayer = 1;
  List<int> matchedCards = [];
  int score = 0;
  int score2 = 0;
  int victorys = 0;
  int victorys2 = 0;
  String? time;
  bool lastAttemptWasMatch = false;

  int get attemptNumber => notifier!.value;

  void _attemptPass() {
    if (isMultplayer) {
      _changePlayer();
    }
    notifier!.value++;
  }

  void validateMatch(List<Map<String, dynamic>> cards) {
    if (cards.length == 2) {
      if (cards[0]['path'] == cards[1]['path'] &&
          cards[0]['index'] != cards[1]['index']) {
        matchedCards.add(cards[0]['index']);
        matchedCards.add(cards[1]['index']);
        _incrementScore();
        if (matchedCards.length == numberOfCards) {
          audioCache.play('notific-win.wav');
          _incrementVictorys();
          Future.delayed(const Duration(milliseconds: 500), () => _reset());
        } else {
          audioCache.play('notific-simple.wav');
          lastAttemptWasMatch = true;
        }
      } else {
        lastAttemptWasMatch = false;
      }
      _attemptPass();
    } else {
      throw Exception('Invalid number of cards');
    }
  }

  _incrementScore() {
    if (currentPlayer == 1) {
      score++;
    } else if (currentPlayer == 2) {
      score2++;
    }
  }

  _incrementVictorys() {
    if (currentPlayer == 1) {
      victorys++;
    } else if (currentPlayer == 2) {
      victorys2++;
    }
  }

  _reset() {
    matchedCards = [];
    score = 0;
    score2 = 0;
    notifier!.value = 0;
  }

  _changePlayer() {
    if (lastAttemptWasMatch) {
      return;
    } else {
      currentPlayer = currentPlayer == 1 ? 2 : 1;
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static GameController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GameController>();
}
