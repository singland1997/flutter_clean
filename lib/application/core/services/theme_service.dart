import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool isDark = false;

  toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
