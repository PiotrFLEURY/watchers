// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watchers/watchers.dart';

void main() {
  group('fireEvent', () {
    test('event found', () {
      // GIVEN
      var called = false;
      final Function callback = () {
        called = true;
      };
      final watcher = Watcher<NumericState>(
        state: NumericState(0),
        builder: (context) => const Text('test'),
        events: {
          'testEvent': callback,
        },
      );

      // WHEN
      watcher.fireEvent('testEvent');

      // THEN
      expect(called, true);
    });

    test('event not found', () {
      // GIVEN
      final Function callback = () {};
      final watcher = Watcher<NumericState>(
        state: NumericState(0),
        builder: (context) => const Text('test'),
        events: {
          'testEvent': callback,
        },
      );

      // WHEN
      try {
        watcher.fireEvent('unknownEvent');
      } catch (e) {
        // THEN
        expect(e, isInstanceOf<Exception>());
      }
    });
  });
}
