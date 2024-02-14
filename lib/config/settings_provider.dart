import 'package:flutter/material.dart';

class settingProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentTheme = ThemeMode.dark;

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  String getBackground() {
    return currentTheme != ThemeMode.dark
        ? "assets/images/main_background.png"
        : "assets/images/bg_dark.png";
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}