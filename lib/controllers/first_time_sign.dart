import 'package:flutter/material.dart';

class FirstTimeSign extends ChangeNotifier {
  static FirstTimeSign instance = FirstTimeSign();

  bool firstTime = true;

  changeFirstTime() {
    firstTime = false;
    notifyListeners();
  }
}
