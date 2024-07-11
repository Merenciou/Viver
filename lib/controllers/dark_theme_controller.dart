import 'package:flutter/material.dart';

class DarkThemeController extends ChangeNotifier {
  static DarkThemeController instance = DarkThemeController();

  bool isDarkTheme = false;

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
