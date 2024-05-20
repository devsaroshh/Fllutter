import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/core/providers/theme_provider.dart';

Widget makeTestableWidgets(child) {
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => StopWatchProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: MaterialApp(home: Scaffold(body: child)));
}
