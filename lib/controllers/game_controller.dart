import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memory_game/models/game_model.dart';
import 'package:memory_game/models/record_model.dart';

// ignore: must_be_immutable
class GameController extends InheritedNotifier<ValueNotifier<int>> {
  final GameModel gameModel;
  final bool isMultplayer;
  final Box<RecordModel> recordBox;
  GameController({
    Key? key, required Widget child,
    required this.gameModel,
    required this.isMultplayer,
    required this.recordBox,
   })
      : super(
          key: key,
          child: child,
          notifier: ValueNotifier(0),
        );
  final AudioCache audioCache = AudioCache(prefix: 'assets/audio/');
  late final int numberOfCards = gameModel.numberOfPairs * 2;
  int? currentPlayer = 1;
  List<int> matchedCards = [];
  int score = 0;
  int score2 = 0;
  int victorys = 0;
  int victorys2 = 0;
  bool lastAttemptWasMatch = false;
  bool lastGameWasRecord = false;
  String? time;
  int? timeInSeconds;

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
          _recordObserver();
          _incrementVictorys();
          _playVictorySound();
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
    if (isMultplayer) {
      if (score > score2) {
        victorys++;
      } else if (score < score2) {
        victorys2++;
      }
    } else {
      victorys++;
    }
  }

  _recordObserver() {
    int record = recordBox.get(gameModel.themeName)?.timeInSeconds ?? 0;
    if (timeInSeconds != null && time != null) {
      if (timeInSeconds! < record || record == 0) {
        recordBox.put(gameModel.themeName, RecordModel()
            ..timeInSeconds = timeInSeconds!
            ..timeString = time!);
        lastGameWasRecord = true;
      } else {
        lastGameWasRecord = false;
      }
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

  _playVictorySound() {
    if (lastGameWasRecord) {
      audioCache.play('record.wav');
    } else if (score != score2) {
      audioCache.play('notific-win.wav');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static GameController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GameController>();
}
