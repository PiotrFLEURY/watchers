import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class FibonnacciState extends ListState<int> {
  FibonnacciState(super.value);

  void increment() {
    if (isEmpty) {
      add(0);
    } else if (length < 2) {
      add(1);
    } else {
      add(this[length - 1] + this[length - 2]);
    }
  }
}

class Fibonnacci extends Watcher<FibonnacciState> {
  Fibonnacci({
    Key? key,
    required Widget Function(BuildContext) builder,
  }) : super(
          key: key,
          state: FibonnacciState([0]),
          builder: builder,
        );

  FibonnacciState get suite => state;

  static Fibonnacci of(BuildContext context) => Watcher.of<Fibonnacci>(context);
}
