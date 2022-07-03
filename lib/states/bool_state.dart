import 'package:watchers/states/generic_state.dart';

/// GenericState implementation for bool
class BoolState extends GenericState<bool> {
  BoolState(super.boolean);

  /// Native == operator used directly on the BoolState
  /// will compare to its value
  @override
  bool operator ==(Object other) => other == value;

  @override
  int get hashCode => value.hashCode;
}
