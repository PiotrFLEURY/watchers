import 'package:example/pages/messages/widgets/input_text.dart';
import 'package:example/pages/messages/widgets/message_list.dart';
import 'package:example/watchers/messages.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Messages(
      builder: (context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: MessageList(context.messages),
            ),
            const Flexible(
              child: InputText(),
            ),
          ],
        ),
      ),
    );
  }
}
