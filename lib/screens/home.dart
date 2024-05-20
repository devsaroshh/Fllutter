import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/app_local_storage/app_local_storage.dart';
import 'package:stopwatch/core/enum/themes.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/core/providers/theme_provider.dart';
import 'package:stopwatch/screens/Views/bottom_view.dart';
import 'package:stopwatch/screens/Views/main_display.dart';
import 'package:stopwatch/screens/app_bar/my_app_bar.dart';
import 'package:stopwatch/screens/landscape_home.dart';

class StopWatchHome extends StatefulWidget {
  const StopWatchHome({super.key});

  @override
  State<StopWatchHome> createState() => _StopWatchHomeState();
}

class _StopWatchHomeState extends State<StopWatchHome>
    with WidgetsBindingObserver {
  final _appLocalStorage = GetIt.I.get<AppLocalStorage>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _changeBrightness();
  }

  void _changeBrightness() {
    final choice = _appLocalStorage.readThemeString();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          if (choice == Themes.system.getValue())
            {context.read<ThemeProvider>().setDefaultMode()}
        });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Provider.of<StopWatchProvider>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: MediaQuery.orientationOf(context) == Orientation.portrait
          ? Column(
              children: [
                const Expanded(child: MainDisplay()),
                const BottomView(),
                SizedBox(height: MediaQuery.viewPaddingOf(context).bottom + 10),
              ],
            )
          : const LandScapeHome(),
    );
  }
}
