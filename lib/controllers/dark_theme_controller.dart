import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeController extends ChangeNotifier {
  static DarkThemeController instance = DarkThemeController();

  bool isDarkTheme = false;

  changeTheme() async {
    isDarkTheme = !isDarkTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDarkTheme);
    notifyListeners();
  }

  loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? darkRead = prefs.getBool('isDark');
    isDarkTheme = darkRead ?? false;
    notifyListeners();
  }
}
