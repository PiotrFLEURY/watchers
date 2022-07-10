import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class EvenOddState extends NumericState {
  EvenOddState(super.value);

  @override
  String get currentState => value % 2 == 0 ? 'even' : 'odd';
}

class EvenOdd extends WatcherBuilder<EvenOddState> {
  EvenOdd({super.key, required super.state, required super.builders});

  static EvenOdd of(BuildContext context) => Watcher.of<EvenOdd>(context);
}
