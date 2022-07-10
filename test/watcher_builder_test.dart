import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'examples/watcher_builder.dart';

void main() {
  testWidgets('watcher builder widget test', (WidgetTester widgetTester) async {
    // GIVEN
    final widget = MaterialApp(
      home: EvenOdd(
        state: EvenOddState(0),
        builders: {
          'even': (context) => ElevatedButton(
                onPressed: () => EvenOdd.of(context).state + 1,
                child: const Text('even'),
              ),
          'odd': (context) => ElevatedButton(
                onPressed: () => EvenOdd.of(context).state - 1,
                child: const Text('odd'),
              ),
        },
      ),
    );

    // WHEN
    await widgetTester.pumpWidget(widget);
    expect(find.text('even'), findsOneWidget);
    final button = find.byType(ElevatedButton);
    await widgetTester.tap(button);
    await widgetTester.pumpAndSettle();

    // THEN
    expect(find.text('even'), findsNothing);
    expect(find.text('odd'), findsOneWidget);

    // AND
    await widgetTester.tap(button);
    await widgetTester.pumpAndSettle();

    expect(find.text('odd'), findsNothing);
    expect(find.text('even'), findsOneWidget);
  });
}
