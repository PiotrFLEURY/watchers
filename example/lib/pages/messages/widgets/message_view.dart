import 'package:example/models/message.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final Message message;
  const MessageView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment:
            message.from == 'me' ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          '${message.from}: ${message.text}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
      subtitle: Align(
        alignment: Alignment.center,
        child: Text('${message.date}'),
      ),
    );
  }
}
