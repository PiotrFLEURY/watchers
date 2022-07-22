import 'package:flutter/widgets.dart';
import 'package:watchers/watchers.dart';

/// Watcher is an InheritedWidget implementation
/// combined with an AnimatedBuilder
/// listenning for changes of a GenericState implementation
class Watcher<S extends GenericState> extends InheritedWidget {
  /// The current state value of the Watcher
  final S state;

  /// The event methods to trigger on events
  final Map<String, Function> events;

  Watcher({
    Key? key,
    required this.state,
    required Widget Function(BuildContext) builder,
    this.events = const {},
  }) : super(
          key: key,
          // AnimatedBuilder will refresh descendant widgets
          // after every state change
          child: AnimatedBuilder(
            animation: state,
            builder: (context, _) => builder(context),
          ),
        );

  /// Static assessor used to access to Watcher from any descendant widget
  static U of<U extends Watcher>(BuildContext context) {
    final U? result = context.dependOnInheritedWidgetOfExactType<U>();
    assert(result != null, 'No InheritedState of type $U found in context');
    return result!;
  }

  /// Fire an event
  void fireEvent(String eventName) {
    final event = events[eventName];
    if (event == null) {
      throw Exception('Event $eventName not found');
    }

    event.call();
  }

  @override
  bool updateShouldNotify(covariant Watcher oldWidget) => false;
}
