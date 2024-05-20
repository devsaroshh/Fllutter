import 'package:flutter/material.dart';
import 'package:stopwatch/core/resources/strings.dart';
import 'package:stopwatch/widgets/theme_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Strings.myStopwatch),
      actions: [
        ThemeButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
