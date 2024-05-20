import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/widgets/custom_button.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StopWatchProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (value.currentTime.inMilliseconds <= 0) ...[
              CustomButton(
                icon: Icons.play_arrow,
                onPressed: () {
                  value.start();
                },
              ),
            ] else ...[
              CustomButton(
                icon: value.isRunning ? Icons.flag : Icons.stop,
                onPressed: () {
                  if (value.isRunning) {
                    value.addLap();
                  } else {
                    value.reset();
                  }
                },
              ),
              CustomButton(
                icon: value.isRunning ? Icons.pause : Icons.play_arrow,
                onPressed: () {
                  if (value.isRunning) {
                    value.pause();
                  } else {
                    value.start();
                  }
                },
              ),
            ]
          ],
        );
      },
    );
  }
}
