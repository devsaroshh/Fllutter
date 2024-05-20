import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/app_local_storage/app_local_storage.dart';
import 'package:stopwatch/core/enum/themes.dart';
import 'package:stopwatch/core/providers/theme_provider.dart';
import 'package:stopwatch/core/resources/strings.dart';

class ThemeButton extends StatelessWidget {
  ThemeButton({
    super.key,
  });
  final appLocalStorage = GetIt.I.get<AppLocalStorage>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => PopupMenuButton<String>(
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: Themes.light.getValue(),
                  child: Text(Strings.light),
                ),
                PopupMenuItem(
                  value: Themes.dark.getValue(),
                  child: Text(Strings.dark),
                ),
                PopupMenuItem(
                  value: Themes.system.getValue(),
                  child: Text(Strings.system),
                ),
              ],
          onSelected: (selection) {
            if (selection == Themes.light.getValue()) {
              context.read<ThemeProvider>().setLightMode();
            } else if (selection == Themes.dark.getValue()) {
              context.read<ThemeProvider>().setDarkMode();
            } else {
              context.read<ThemeProvider>().setDefaultMode();
            }
            appLocalStorage.storeThemeString(selection);
          },
          icon: value.currentTheme.brightness == Brightness.dark
              ? const Icon(Icons.sunny)
              : const Icon(Icons.nightlight_outlined)),
    );
  }
}
