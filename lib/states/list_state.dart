import 'package:watchers/states/generic_state.dart';

/// GenericState implementation for Lists
/// State update can be trigged just by using add or remove operations
class ListState<T> extends GenericState<List<T>> {
  ListState(super.list);

  /// Native [] operator used as shortcut to access to a single state value
  operator [](index) => list[index];

  /// shortcut used for code comprehension
  List<T> get list => value;

  /// shortcut used for code comprehension
  bool get isEmpty => list.isEmpty;

  /// shortcut used for code comprehension
  int get length => list.length;

  /// shortcut used for code comprehension
  T get last => list[length - 1];

  /// add operation used to trigger change on element added
  ///
  /// usage: MyWatcher.of(context).state.add(42)
  ///
  void add(T element) {
    value.add(element);
    notifyListeners();
  }

  /// remove operation used to trigger change on element removed
  ///
  /// usage: MyWatcher.of(context).state.remove(42)
  ///
  void remove(T element) {
    value.remove(element);
    notifyListeners();
  }
}
