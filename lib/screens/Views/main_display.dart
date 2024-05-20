import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/screens/Views/stop_watch_counter.dart';
import 'package:stopwatch/widgets/laps_list.dart';

class MainDisplay extends StatelessWidget {
  const MainDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer<StopWatchProvider>(
          builder: (context, value, child) {
            return Stack(
              children: [
                AnimatedPositioned(
                  top: value.totalLaps.isEmpty
                      ? constraints.maxHeight * 0.5
                      : 20,
                  right: 0,
                  left: 0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                  child: Center(
                    child: StopWatchCounter(
                      getElapsedTime: value.getTimeStream,
                      initialTime: value.currentTime,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 5,
                  right: 5,
                  child: Container(
                    padding:
                        EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
                    height: constraints.maxHeight * 0.9,
                    width: constraints.maxWidth,
                    child: const LapsList(),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
