import 'package:flutter/material.dart';
import 'package:viva_pratical_2/models/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  Light light = Light(isDark: false);

  void changeTheme() {
    light.isDark = !light.isDark;
    notifyListeners();
  }
}

