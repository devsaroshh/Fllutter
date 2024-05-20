import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/screens/Views/bottom_view.dart';
import 'package:stopwatch/screens/Views/stop_watch_counter.dart';
import 'package:stopwatch/widgets/laps_list.dart';

class LandScapeHome extends StatelessWidget {
  const LandScapeHome({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingLeft = MediaQuery.viewPaddingOf(context).left;
    final paddingRight = MediaQuery.viewPaddingOf(context).right;
    return Padding(
      padding: EdgeInsets.only(right: paddingRight, left: paddingLeft),
      child: LayoutBuilder(
        builder: (context, constraints) => Consumer<StopWatchProvider>(
          builder: (context, value, child) => Stack(
            children: [
              Positioned(
                top: 15,
                right: 20,
                child: SizedBox(
                  height: constraints.maxHeight * 0.9,
                  width: constraints.maxWidth * 0.5,
                  child: const LapsList(),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                left: value.totalLaps.isEmpty ? 0 : 0,
                right: value.totalLaps.isEmpty ? 0 : constraints.maxWidth * 0.6,
                child: Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.7,
                      child: Center(
                        child: StopWatchCounter(
                          getElapsedTime: value.getTimeStream,
                          initialTime: value.currentTime,
                        ),
                      ),
                    ),
                    const BottomView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
