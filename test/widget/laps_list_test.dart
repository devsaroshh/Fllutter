import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/core/providers/stop_watch_provider.dart';
import 'package:stopwatch/widgets/lap_item.dart';
import 'package:stopwatch/widgets/laps_list.dart';

import '../utils/make_testable_widgets.dart';

void main() {
  testWidgets('renders correctly when totalLaps is empty',
      (tester) async {
    await tester.pumpWidget(
      makeTestableWidgets(
        const LapsList(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(AnimatedOpacity), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(LapItem), findsNothing);
  });

  testWidgets('tapping on the icon calls changeDirection',
      (tester) async {
    final stopWatchProvider = StopWatchProvider();

    await tester.pumpWidget(
      makeTestableWidgets(
        const LapsList(),
      ),
    );

    await tester.tap(find.byIcon(Icons.format_line_spacing_outlined));
    await tester.pump();

    expect(stopWatchProvider.reverse, isFalse);
  });
}
