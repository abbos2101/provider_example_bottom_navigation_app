import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  bool saveState = true;
  int bottomIndex = 0;
  int publicCount = 0;

  void launch() async {
    await Future.delayed(Duration.zero);
    print('Salom');
    notifyListeners();
  }

  void onChangedBottomId(int index) {
    bottomIndex = index;
    notifyListeners();
  }

  void onSaveState(bool value) {
    saveState = value;
    notifyListeners();
  }

  void onIcrementPublicCount() {
    publicCount++;
    notifyListeners();
  }
}
