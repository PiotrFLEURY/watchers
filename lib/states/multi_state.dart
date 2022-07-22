import 'package:watchers/watchers.dart';

/// MultiState are used to manage multiple states for a single screen
/// like loading, error, etc.
abstract class MultiState<T> extends GenericState<T> {
  MultiState(super.value);

  /// Return the current "state" name
  String get currentState;
}
