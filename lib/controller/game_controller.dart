import 'package:flutter/material.dart';

class GameController extends ChangeNotifier {
  String? flipedPath;
  bool match = false;
  int attempt = 1;

  static GameController instance = GameController();

  backFlip() {
    if (flipedPath != null) {
      this.attempt -= 1;
      notifyListeners();
    }
  }

  bool validatePairs(String path) {
    if (path == flipedPath) {
      match = !match;
      attempt -= 1;
      return match;
    }
    flipedPath = null;
    return match;
  }
}
