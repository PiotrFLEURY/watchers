import 'package:example/pages/authentication/authentication_page.dart';
import 'package:example/pages/even_odd/even_odd_page.dart';
import 'package:example/pages/events/events_page.dart';
import 'package:example/pages/events_and_builders/events_and_builders_page.dart';
import 'package:example/pages/fibonnacci/fibonacci_page.dart';
import 'package:example/pages/counter/counter_page.dart';
import 'package:example/pages/home/home.dart';
import 'package:example/pages/messages/messages_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State management Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => const HomePage(),
        '/messages': (context) => const MessagesPage(),
        '/counter': (context) => const CounterPage(
              title: 'Flutter state management demo',
            ),
        '/fibonnacci': (context) => const FibonnacciPage(),
        '/authentication': (context) => const AuthenticationPage(),
        '/evenOdd': (context) => const EvenOddPage(),
        '/events': (context) => const EventsPage(),
        '/eventsAndBuilders': (context) => const EventsAndBuildersPage(),
      },
      initialRoute: initialRoute,
    );
  }
}
