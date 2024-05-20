import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/widgets/drawer_item.dart';

import '../utils/make_testable_widgets.dart';

void main() {
  testWidgets('DrawerItem should trigger onTap callback',
      (tester) async {
    var onTapCalled = false;

    await tester.pumpWidget(
      makeTestableWidgets(
        DrawerItem(
          title: 'Example Item',
          trailingIcon: Icons.arrow_forward,
          onTap: () {
            onTapCalled = true;
          },
        ),
      ),
    );

    expect(find.byType(DrawerItem), findsOneWidget);

    await tester.tap(find.byType(ListTile));
    await tester.pump();

    expect(onTapCalled, isTrue);
  });
}
