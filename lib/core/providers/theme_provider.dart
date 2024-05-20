import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:stopwatch/core/app_local_storage/app_local_storage.dart';
import 'package:stopwatch/core/enum/themes.dart';

class ThemeProvider with ChangeNotifier {

  ThemeProvider() {
    setStoredTheme();
  }
  
  late ThemeData currentTheme;
  final appLocalStorage = GetIt.I.get<AppLocalStorage>();

  void setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }

  void setDefaultMode() {
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    if (brightness == Brightness.dark) {
      setDarkMode();
    } else {
      setLightMode();
    }
    notifyListeners();
  }

  void setStoredTheme() {
    final choice = appLocalStorage.readThemeString();
    if (choice == Themes.light.getValue()) {
      setLightMode();
    } else if (choice == Themes.dark.getValue()) {
      setDarkMode();
    } else {
      setDefaultMode();
    }
  }
}
