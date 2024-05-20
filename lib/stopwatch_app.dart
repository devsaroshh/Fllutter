import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/providers/theme_provider.dart';
import 'package:stopwatch/core/resources/strings.dart';
import 'package:stopwatch/screens/home.dart';

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.stopwatch,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const StopWatchHome(),
      builder: (context, child) {
        final data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: child!,
        );
      },
    );
  }
}
