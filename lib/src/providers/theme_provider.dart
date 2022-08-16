/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:quran_flutter_app/src/utils/theme_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemePreferences themePreferences = ThemePreferences();
  late bool _isDark;
  bool get isDark => _isDark;
  set isDark(bool value) {
    _isDark = value;
    themePreferences.setThemeMode(_isDark);
    notifyListeners();
  }

  ThemeProvider() {
    _isDark = true;
    getCurrentTheme();
  }
  getCurrentTheme() async {
    _isDark = await themePreferences.getThemeMode();
    notifyListeners();
  }
}
