import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchers/watchers.dart';

part 'events_and_builders.freezed.dart';

@freezed
class EventsData with _$EventsData {
  const factory EventsData({
    @Default(false) bool loading,
    @Default(false) bool validating,
    @Default(0) int count,
  }) = _EventsData;
}

class EventsState extends MultiState<EventsData> {
  EventsState() : super(const EventsData());

  void increment() {
    value = value.copyWith(count: value.count + 1);
  }

  void startLoading() {
    value = value.copyWith(loading: true);
  }

  void stopLoading() {
    value = value.copyWith(loading: false);
  }

  void validating() {
    value = value.copyWith(validating: true);
  }

  void validated() {
    value = value.copyWith(validating: false);
  }

  @override
  String get currentState {
    if (value.loading) {
      return Events.stateLoading;
    } else if (value.validating) {
      return Events.stateValidating;
    }
    return Events.stateIdle;
  }
}

class Events extends WatcherBuilder<EventsState> {
  static const String httpError = 'httpError';
  static const String invalidInput = 'invalidInput';
  static const String heavyComputationStarted = 'heavyComputationStarted';
  static const String heavyComputationFinished = 'heavyComputationFinished';

  static const String stateValidating = 'validating';
  static const String stateLoading = 'loading';
  static const String stateIdle = 'idle';

  Events({
    super.key,
    required super.state,
    required Function onHttpError,
    required Function onInvalidInput,
    required Function onHeavyComputationStarted,
    required Function onHeavyComputationFinished,
    required WidgetBuilder validating,
    required WidgetBuilder loading,
    required WidgetBuilder idle,
  }) : super(
          events: {
            httpError: onHttpError,
            invalidInput: onInvalidInput,
            heavyComputationStarted: onHeavyComputationStarted,
            heavyComputationFinished: onHeavyComputationFinished,
          },
          builders: {
            stateValidating: validating,
            stateLoading: loading,
            stateIdle: idle,
          },
        );

  static Events of(BuildContext context) => Watcher.of<Events>(context);

  Future<void> makeHttpDummyCall() async {
    state.startLoading();
    await Future.delayed(const Duration(seconds: 1));
    fireEvent(httpError);
    state.stopLoading();
  }

  Future<void> validateInput() async {
    state.validating();
    await Future.delayed(const Duration(seconds: 1));
    fireEvent(invalidInput);
    state.validated();
  }

  void incrementCount() {
    state.increment();
  }

  Future<void> computeHeavyValue() async {
    fireEvent(heavyComputationStarted);
    // computing human genetic code...
    await Future.delayed(const Duration(seconds: 3));
    state.value = state.value.copyWith(count: 42);
    fireEvent(heavyComputationFinished);
  }
}

extension EventsExtension on BuildContext {
  Events get events => Events.of(this);

  bool get loading => events.state.value.loading;

  num get count => events.state.value.count;
}
