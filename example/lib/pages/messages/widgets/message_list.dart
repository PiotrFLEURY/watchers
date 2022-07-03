import 'package:example/models/message.dart';
import 'package:example/pages/messages/widgets/message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MessageList extends StatefulWidget {
  final List<Message> _messageList;
  const MessageList(
    this._messageList, {
    Key? key,
  }) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  late ScrollController _controller;

  List<Widget> _mapMessages(BuildContext context) {
    return widget._messageList.map((e) => MessageView(message: e)).toList();
  }

  void _scrollDown() {
    debugPrint('scrolling down');
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollDown();
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => _scrollDown());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('building message list');
    return ListView(
      controller: _controller,
      children: _mapMessages(context),
    );
  }
}
