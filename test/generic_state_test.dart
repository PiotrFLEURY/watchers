import 'package:flutter_test/flutter_test.dart';
import 'package:watchers/states/generic_state.dart';
import 'package:watchers/watchers.dart';

class User {
  final String name;
  final int age;

  const User(this.name, this.age);
}

void main() {
  group('generic state unit tests', () {
    test('get value', () {
      // GIVEN
      const user = User('toto', 42);
      final state = GenericState(user);

      // THEN
      final result = state.value;

      // THEN
      expect(result, user);
    });
    test('set value', () {
      // GIVEN
      const user = User('toto', 42);
      final state = GenericState(user);

      // THEN
      const otherUser = User('titi', 12);
      state.value = otherUser;
      final result = state.value;

      // THEN
      expect(result, otherUser);
    });

    test('toString', () {
      // GIVEN
      const user = User('toto', 42);
      final state = GenericState(user);

      // THEN
      final result = state.toString();

      // THEN
      expect(result, user.toString());
    });
  });
}
