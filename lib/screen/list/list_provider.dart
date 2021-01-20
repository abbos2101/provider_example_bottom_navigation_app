import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  int count = 0;

  void onIncrement() {
    count++;
    notifyListeners();
  }
}
