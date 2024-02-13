import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentThemeMode = ThemeMode.light;

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeTheme(ThemeMode newTheme) {
    if (currentThemeMode == newTheme) return;
    currentThemeMode == newTheme;
    notifyListeners();
  }
}
