import 'package:watchers/states/generic_state.dart';

/// GenericState implementation for numbers
/// State update can be trigged just by using native operators
class NumericState extends GenericState<num> {
  NumericState(super.number);

  /// Native + operator used to trigger change on value increment
  ///
  /// usage: MyWatcher.of(context).state + 42
  ///
  operator +(num other) => value += other;

  /// Native - operator used to trigger change on value decrement
  ///
  /// usage: MyWatcher.of(context).state - 42
  ///
  operator -(num other) => value -= other;

  /// Native * operator used to trigger change on value multiplication
  ///
  /// usage: MyWatcher.of(context).state * 42
  ///
  operator *(num other) => value *= other;

  /// Native / operator used to trigger change on value division
  ///
  /// usage: MyWatcher.of(context).state / 42
  ///
  operator /(num other) => value /= other;
}
