import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class Counter extends Watcher<NumericState> {
  Counter({
    super.key,
    required super.state,
    required super.builder,
  });

  get count => state;

  static Counter of(BuildContext context) => Watcher.of<Counter>(context);
}

extension CounterWatcherExtension on BuildContext {
  Counter get counter => Counter.of(this);

  NumericState get count => counter.count;
}
