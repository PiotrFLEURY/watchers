import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class EvenOddState extends MultiState<int> {
  EvenOddState(super.value);

  @override
  String get currentState => value % 2 == 0 ? 'even' : 'odd';

  operator +(int other) => value += other;

  operator -(int other) => value -= other;
}

class EvenOdd extends WatcherBuilder<EvenOddState> {
  EvenOdd({super.key, required super.state, required super.builders});

  static EvenOdd of(BuildContext context) => Watcher.of<EvenOdd>(context);
}
