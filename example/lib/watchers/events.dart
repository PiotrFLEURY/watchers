import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchers/watchers.dart';

part 'events.freezed.dart';

@freezed
class EventsData with _$EventsData {
  const factory EventsData({
    @Default(false) bool loading,
    @Default(0) int count,
  }) = _EventsData;
}

class EventsState extends GenericState<EventsData> {
  EventsState() : super(const EventsData());

  void increment() {
    value = value.copyWith(count: value.count + 1);
  }
}

class Events extends Watcher<EventsState> {
  static const String httpError = 'httpError';
  static const String invalidInput = 'invalidInput';

  Events({
    super.key,
    required super.state,
    required Function onHttpError,
    required Function onInvalidInput,
    required super.builder,
  }) : super(
          events: {
            httpError: onHttpError,
            invalidInput: onInvalidInput,
          },
        );

  static Events of(BuildContext context) => Watcher.of<Events>(context);

  Future<void> makeHttpDummyCall() async {
    await Future.delayed(const Duration(seconds: 1));
    fireEvent(httpError);
  }

  void validateInput() {
    fireEvent(invalidInput);
  }

  void incrementCount() {
    state.increment();
  }
}

extension EventsExtension on BuildContext {
  Events get events => Events.of(this);

  bool get loading => events.state.value.loading;

  num get count => events.state.value.count;
}
