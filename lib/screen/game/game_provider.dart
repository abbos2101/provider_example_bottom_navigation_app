import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  int count = 0;

  void onIncrement() {
    count++;
    notifyListeners();
  }
}
