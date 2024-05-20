import 'package:flutter/material.dart';
import 'package:stopwatch/core/resources/strings.dart';

class DisplayTime extends StatelessWidget {
  const DisplayTime(this.time, {super.key});

  final Duration time;
  final lineStyle = const TextStyle(fontSize: 15, letterSpacing: 10.0);
  final textStyle = const TextStyle(fontSize: 32);

  @override
  Widget build(BuildContext context) {
    final timer = time.toString().split(':');
    final hours = timer[0];
    final minutes = timer[1];
    final seconds = timer[2];

    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hours, style: textStyle),
            Text(Strings.parallel, style: lineStyle),
            Text(
              minutes,
              style: textStyle,
            ),
            Text(
              Strings.parallel,
              style: lineStyle,
            ),
            SizedBox(
              width: 100.0,
              child: Text(
                seconds.substring(0, 5),
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
