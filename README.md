# Watchers

An InheritedWidget state management implementaton

## Features

Manage your app state using `Watchers` for your states

## Getting started

Add the dependency

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  watchers:
    git: git@github.com:PiotrFLEURY/watchers.git
```

## Usage

First create your watcher

```dart
// Counter will watch for any change of the NumericState
class Counter extends Watcher<NumericState> {
  Counter({
    super.key,
    required super.state,
    required super.builder,
  });

  get count => state;

  static Counter of(BuildContext context) => Watcher.of<Counter>(context);
}
```

Create some shortcuts assessors (optional)

```dart
extension CounterWatcherExtension on BuildContext {
  Counter get counter => Counter.of(this);

  NumericState get count => counter.count;
}
```

Place it in your page

```dart
// counter_page.dart
import 'package:example/watchers/counter.dart';
import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

// ...

  @override
  Widget build(BuildContext context) {
    return Counter(
      state: NumericState(0),
      builder: (context) {
        // ...
      },
    );
  }

// ...

```

Read it from any descendant widget

```dart

// With your shortcut
Text('${context.count}')

// or without
Text('${Counter.of(this).count}')

```

Write value in state

```dart

// Trigger state changes just by setting state new value

// With your shortcut
context.count = 42;

// or without
Counter.of(this).count = 42;

```

Write value using native operator

```dart
// my_widget.dart

// just call native operator without any affectation will trigger state update

// With your shortcut
context.count + 1;

// or without
Counter.of(this).count + 1;

// Basic operations can be use for numeric value (+ - * /)

```

Full code

```dart
// counter.dart
import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class Counter extends Watcher<NumericState> {
  Counter({
    super.key,
    required super.state,
    required super.builder,
  });

  get count => state;

  static Counter of(BuildContext context) => Watcher.of<Counter>(context);
}

extension CounterWatcherExtension on BuildContext {
  Counter get counter => Counter.of(this);

  NumericState get count => counter.count;
}

// counter_page.dart
import 'package:example/watchers/counter.dart';
import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Counter(
      state: NumericState(0),
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${context.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.count + 1;
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

## Available States

* BoolState - For booleans
* ListState - For collections
* NumericState - For numbers
* GenericState - For any custom object that you want to watch