import 'package:example/models/message.dart';
import 'package:example/watchers/messages.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText({super.key});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late TextEditingController textController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: true,
        focusNode: _focusNode,
        controller: textController,
        onSubmitted: (_) => _sendMessage(context),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Write your message here',
          suffix: IconButton(
            onPressed: () => _sendMessage(context),
            icon: const Icon(
              Icons.send,
            ),
          ),
        ),
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final message = textController.text;
    if (message.isNotEmpty) {
      Messages.of(context).messages.add(
            Message(
              from: 'me',
              date: DateTime.now(),
              text: message,
            ),
          );
      Messages.of(context).messages.add(
            Message(
              from: 'other',
              date: DateTime.now(),
              text: 'random answer',
            ),
          );
      textController.text = '';
      _focusNode.requestFocus();
    }
  }
}
