import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopwatch/core/app_local_storage/app_local_storage.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/core/providers/theme_provider.dart';
import 'package:stopwatch/stopwatch_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();
  final appLocalStorage = AppLocalStorage(sharedPrefs);

  GetIt.I.registerSingleton<AppLocalStorage>(appLocalStorage);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StopWatchProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const StopwatchApp(),
    ),
  );
}
