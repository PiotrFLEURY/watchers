import 'package:flutter_test/flutter_test.dart';
import 'package:watchers/watchers.dart';

class ExampleState extends MultiState<int> {
  ExampleState(super.value);

  @override
  String get currentState => value % 2 == 0 ? 'even' : 'odd';
}

void main() {
  group('multi state', () {
    test('currentState', () {
      // GIVEN
      final state = ExampleState(42);

      // THEN
      final result = state.currentState;

      // THEN
      expect(result, 'even');
    });

    test('currentState evolution', () {
      // GIVEN
      final state = ExampleState(42);
      state.value = 43;

      // THEN
      final result = state.currentState;

      // THEN
      expect(result, 'odd');
    });
  });
}
