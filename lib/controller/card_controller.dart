import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CardController extends ChangeNotifier {
  bool flipped = false;
  late AnimationController animation;
  Duration duration = const Duration(milliseconds: 400);
  Matrix4 transform = Matrix4.inverted(Matrix4.rotationY(pi));

  double value = 0;
  
  flipCard() {
    flipped = !flipped;
    notifyListeners();
  }

  CardController();
}
