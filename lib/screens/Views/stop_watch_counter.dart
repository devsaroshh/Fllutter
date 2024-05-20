import 'package:flutter/material.dart';
import 'package:stopwatch/core/resources/strings.dart';
import 'package:stopwatch/widgets/display_time.dart';

class StopWatchCounter extends StatelessWidget {
  const StopWatchCounter({
    super.key,
    required this.getElapsedTime,
    required this.initialTime,
  });

  final Stream<Duration> getElapsedTime;
  final Duration initialTime;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: getElapsedTime,
      initialData: initialTime,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text(
            Strings.initialTimer,
            style: const TextStyle(fontSize: 32),
          );
        }
        return DisplayTime(snapshot.data!);
      },
    );
  }
}
