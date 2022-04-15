import 'dart:math';

import 'package:flutter/material.dart';

class CardController extends ChangeNotifier {
  bool flipped = false;
  bool matched = false;
  late AnimationController animation;
  Duration duration = const Duration(milliseconds: 400);
  Matrix4 transform = Matrix4.inverted(Matrix4.rotationY(pi));

  CardController();

  void flipCard() {
    flipped = !flipped;
    notifyListeners();
  }
  void setMatch() {
    matched = true;
    notifyListeners();
  }
}
