import 'package:flutter_test/flutter_test.dart';
import 'package:watchers/states/list_state.dart';

void main() {
  group('listState', () {
    test('index', () {
      // GIVEN
      final state = ListState([1, 2, 3]);

      // THEN
      final result = state[1];

      // THEN
      expect(result, 2);
    });

    test('get list', () {
      // GIVEN
      final numbers = [1, 2, 3];
      final state = ListState(numbers);

      // THEN
      final result = state.list;

      // THEN
      expect(result, numbers);
    });

    test('isEmpty false', () {
      // GIVEN
      final numbers = [1, 2, 3];
      final state = ListState(numbers);

      // THEN
      final result = state.isEmpty;

      // THEN
      expect(result, false);
    });

    test('isEmpty true', () {
      // GIVEN
      final numbers = [];
      final state = ListState(numbers);

      // THEN
      final result = state.isEmpty;

      // THEN
      expect(result, true);
    });

    test('length', () {
      // GIVEN
      final numbers = [1, 2, 3];
      final state = ListState(numbers);

      // THEN
      final result = state.length;

      // THEN
      expect(result, 3);
    });

    test('add', () {
      // GIVEN
      final numbers = [1, 2, 3];
      final state = ListState(numbers);

      // THEN
      state.add(4);
      final result = state.list;

      // THEN
      expect(result, [1, 2, 3, 4]);
    });

    test('remove', () {
      // GIVEN
      final numbers = [1, 2, 3];
      final state = ListState(numbers);

      // THEN
      state.remove(2);
      final result = state.list;

      // THEN
      expect(result, [1, 3]);
    });
    test('last', () {
      // GIVEN
      final numbers = [1, 2, 3];
      final state = ListState(numbers);

      // THEN
      final result = state.last;

      // THEN
      expect(result, 3);
    });
  });
}
