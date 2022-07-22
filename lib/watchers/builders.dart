import 'package:flutter/material.dart';
import 'package:watchers/states/multi_state.dart';
import 'package:watchers/watchers/watcher.dart';

/// Builder class handling content switching depending on the current state
///
/// Provide multiple builders with different state names
///
/// MyWatcher(
///
///   state: MyState(),
///
///   builders: {
///
///     'loading': _buildLoadingFunction,
///
///     'error': _buildError,
///
///     'showContent': _buildContentFunction,
///
///     'makingCoffee': _teapot,
///
///     '42': _answerToUniversAndEverythingElse,
///
///   }
///
/// )
class WatcherBuilder<S extends MultiState> extends Watcher<S> {
  /// Contains a map of WidgetBuilder by state name
  /// the WidgetBuilder corresponding to the state name of the current state
  /// will be build
  final Map<String, WidgetBuilder> builders;

  WatcherBuilder({
    super.key,
    required super.state,
    required this.builders,
    super.events,
  }) : super(
          builder: (context) => _WatcherBuilder(
            state,
            builders,
          ),
        );
}

class _WatcherBuilder extends StatelessWidget {
  final MultiState state;
  final Map<String, WidgetBuilder> builders;

  const _WatcherBuilder(this.state, this.builders);

  @override
  Widget build(BuildContext context) {
    return builders[state.currentState]!.call(context);
  }
}
