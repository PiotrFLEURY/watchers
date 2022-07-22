import 'package:flutter/widgets.dart';
import 'package:watchers/watchers.dart';

class EvenOrOdd extends WatcherBuilder<EvenOddState> {
  EvenOrOdd({super.key, required super.state, required super.builders});

  static EvenOrOdd of(BuildContext context) => Watcher.of<EvenOrOdd>(context);
}

class EvenOddState extends MultiState<int> {
  EvenOddState(super.number) {
    _infiniteLoop();
  }

  void _infiniteLoop() {
    Future.delayed(const Duration(seconds: 1), () {
      value = value + 1;
      debugPrint('value:$value');
      _infiniteLoop();
    });
  }

  @override
  String get currentState => value % 2 == 0 ? 'even' : 'odd';
}
