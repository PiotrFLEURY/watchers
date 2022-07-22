import 'dart:math';

import 'package:example/watchers/events.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Events(
      state: EventsState(),
      onHttpError: () => _onHttpError(context),
      onInvalidInput: () => _onInvalidInput(context),
      builder: (context) => _EventsPage(
        buttonPressed: () => _buttonPressed(context),
      ),
    );
  }

  void _buttonPressed(BuildContext context) {
    final seed = Random().nextInt(3);
    switch (seed) {
      case 0:
        context.events.makeHttpDummyCall();
        break;
      case 1:
        context.events.validateInput();
        break;
      case 2:
        context.events.incrementCount();
        break;
    }
  }

  void _onHttpError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('HTTP error'),
      ),
    );
  }

  _onInvalidInput(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid input'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

class _EventsPage extends StatelessWidget {
  final void Function()? buttonPressed;
  const _EventsPage({
    Key? key,
    required this.buttonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: buttonPressed,
        child: const Icon(
          Icons.shuffle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Press the button for random event',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'You pressed the button ${context.count} times',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
