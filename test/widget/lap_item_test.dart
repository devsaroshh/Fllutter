import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/widgets/lap_item.dart';

import '../utils/make_testable_widgets.dart';

void main() {
  testWidgets('LapItem should display index and duration',
      (tester) async {
    const testIndex = 1;
    const testDuration = Duration(minutes: 2, seconds: 30);

    await tester.pumpWidget(
      makeTestableWidgets(
        const LapItem(
          index: testIndex,
          duration: testDuration,
        ),
      ),
    );

    expect(find.byType(LapItem), findsOneWidget);
    expect(find.text('$testIndex'), findsOneWidget);
    expect(find.text(testDuration.toString()), findsOneWidget);
  });
}
