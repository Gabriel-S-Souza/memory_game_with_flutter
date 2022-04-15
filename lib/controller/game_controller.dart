import 'package:flutter/material.dart';

class GameController extends InheritedNotifier<ValueNotifier<int>> {
  GameController({Key? key, required Widget child}) 
      : super(
        key: key, 
        child: child,
        notifier: ValueNotifier(1),
      );
  
  int get attemptNumber => notifier!.value; 

  changeAttemptNumber() {
    notifier!.value = notifier!.value == 1 ? 2 : 1;
  }


  
  
  String? firstCardFlippedId;
  String? secondCardFlippedId;

  void addFirstCardId(String cardId) {
    firstCardFlippedId = cardId;
  }

  bool validateMatch(String cardId) {
    secondCardFlippedId = cardId;
    if (firstCardFlippedId == cardId) {
      return true;
    }
    firstCardFlippedId = null;
    return false;
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static GameController? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<GameController>();
}


