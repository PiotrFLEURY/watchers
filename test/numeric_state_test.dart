import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watchers/watchers.dart';
import 'examples/numeric_watcher.dart';

main() {
  testWidgets('numericState', (widgetTester) async {
    // GIVEN
    final widget = MaterialApp(
      home: NumericWatcher(
        state: NumericState(0),
        builder: (context) => Column(
          children: [
            Text('${NumericWatcher.of(context).state.value}'),
            ElevatedButton(
              onPressed: () {
                NumericWatcher.of(context).number + 1;
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );

    // WHEN
    await widgetTester.pumpWidget(widget);
    expect(find.text('0'), findsOneWidget);
    final button = find.byType(ElevatedButton);
    await widgetTester.tap(button);
    await widgetTester.pumpAndSettle();
    // THEN
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
