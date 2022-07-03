import 'package:example/models/message.dart';
import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class MessagesState extends ListState<Message> {
  MessagesState(super.value);
}

class Messages extends Watcher<MessagesState> {
  Messages({super.key, required super.builder})
      : super(state: MessagesState([]));

  ListState<Message> get messages => state;

  static Messages of(BuildContext context) => Watcher.of<Messages>(context);
}

extension MessagesExtension on BuildContext {
  List<Message> get messages => Messages.of(this).state.list;
}
