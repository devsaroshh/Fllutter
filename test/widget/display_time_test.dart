import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/widgets/display_time.dart';

import '../utils/make_testable_widgets.dart';

void main() {
  testWidgets('DisplayTime widget displays correct time',
      (tester) async {
    await tester.pumpWidget(
      makeTestableWidgets(
          const DisplayTime(Duration(hours: 1, minutes: 30, seconds: 45))),
    );

    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(Card), findsOneWidget);
  });
}
