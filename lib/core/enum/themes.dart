import 'package:stopwatch/core/resources/strings.dart';

enum Themes { light, dark, system }

extension ThemeExtension on Themes {
  String getValue() {
    switch (this) {
      case Themes.light:
        return Strings.light.toLowerCase();
      case Themes.dark:
        return Strings.dark.toLowerCase();
      case Themes.system:
        return Strings.systemTheme;
    }
  }
}
