import 'dart:math';

import 'package:example/watchers/events_and_builders.dart';
import 'package:flutter/material.dart';

class EventsAndBuildersPage extends StatelessWidget {
  const EventsAndBuildersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Events(
          state: EventsState(),
          onHttpError: () => _onHttpError(context),
          onInvalidInput: () => _onInvalidInput(context),
          onHeavyComputationStarted: () => _onHeavyComputationStarted(context),
          onHeavyComputationFinished: () =>
              _onHeavyComputationFinished(context),
          validating: _buildValidating,
          loading: _buildLoading,
          idle: _buildIdle,
        );
      }),
    );
  }

  void _onHeavyComputationStarted(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Heavy computation in progress...',
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        },
      ),
    );
  }

  void _onHeavyComputationFinished(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildValidating(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Validating...'),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildIdle(BuildContext context) {
    return _EventsAndBuildersPage(
      buttonPressed: () => _buttonPressed(context),
    );
  }

  void _buttonPressed(BuildContext context) {
    final seed = Random().nextInt(4);
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
      case 3:
        context.events.computeHeavyValue();
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

class _EventsAndBuildersPage extends StatelessWidget {
  final void Function()? buttonPressed;
  const _EventsAndBuildersPage({
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
              'Press the button for random event and states',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
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
