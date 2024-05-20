import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/widgets/lap_item.dart';

class LapsList extends StatelessWidget {
  const LapsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StopWatchProvider>(
      builder: (context, value, child) => AnimatedOpacity(
        opacity: value.totalLaps.isEmpty ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      context.read<StopWatchProvider>().changeDirection();
                    },
                    child: const Icon(Icons.format_line_spacing_outlined)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.totalLaps.length,
                controller: value.scrollController,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  final isReverse = context.watch<StopWatchProvider>().reverse;
                  final reverseIndex = value.totalLaps.length - 1 - index;
                  return LapItem(
                    index: (isReverse ? reverseIndex : index) + 1,
                    duration: value.totalLaps[isReverse ? reverseIndex : index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
