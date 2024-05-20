import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/widgets/custom_button.dart';

import '../utils/make_testable_widgets.dart';


void main() {
  testWidgets('CustomButton should trigger onPressed callback',
      (tester) async {
    var onPressedCalled = false;

    await tester.pumpWidget(
      makeTestableWidgets(
        CustomButton(
          icon: Icons.add,
          onPressed: () {
            onPressedCalled = true;
          },
        ),
      ),
    );

    expect(find.byType(CustomButton), findsOneWidget);

    await tester.tap(find.byType(CustomButton));
    await tester.pump();

    expect(onPressedCalled, isTrue);
  });
}
