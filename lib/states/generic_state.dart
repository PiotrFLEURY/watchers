import 'package:flutter/foundation.dart';

typedef ChangeCallback = void Function();

/// GenericState is a ChangeNotifier implementation
/// It is used to be listened by Watcher implementations
/// This class is the state holder and its responsibility is to
/// notify that something has changed in the state
///
/// This is the concrete representation of what state should be
///
/// Generic type V is the type of the data to watch
///
class GenericState<V> with ChangeNotifier {
  /// Data value watched
  V _value;

  GenericState(this._value);

  /// Public assessor
  V get value => _value;

  /// Public value setter (will trigger Watchers)
  set value(v) {
    _value = v;
    notifyListeners();
  }

  @override
  String toString() => _value.toString();
}
