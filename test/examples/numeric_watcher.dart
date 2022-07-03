import 'package:flutter/widgets.dart';
import 'package:watchers/watchers.dart';

class NumericWatcher extends Watcher<NumericState> {
  NumericWatcher({super.key, required super.state, required super.builder});

  NumericState get number => state;

  static NumericWatcher of(BuildContext context) =>
      Watcher.of<NumericWatcher>(context);
}
