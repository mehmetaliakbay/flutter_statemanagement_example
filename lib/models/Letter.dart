import 'package:flutter/material.dart';
import 'dart:math' show Random;

class Letter with ChangeNotifier {
  Random rnd = new Random();
  String _letter;
  Letter(this._letter);

  String get letter => _letter;

  set letter(String value) {
    _letter = value;
  }

  int randomBetween(int min, int max) {
    return min + rnd.nextInt(max - min);
  }

  void addLetter() {
    _letter = letter + String.fromCharCode(randomBetween(33, 126));
    notifyListeners();
  }

  void subLetter() {
    if (letter.length > 0) {
      String temp = letter.substring(0, letter.length - 1);
      _letter = temp;
    }
    notifyListeners();
  }
}
