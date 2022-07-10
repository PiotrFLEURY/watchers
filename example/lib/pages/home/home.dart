import 'package:example/pages/home/widgets/page_selector.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          PageSelector(label: 'Counter', path: '/counter'),
          PageSelector(label: 'Fibonnacci', path: '/fibonnacci'),
          PageSelector(label: 'Messages', path: '/messages'),
          PageSelector(label: 'Authentication', path: '/authentication'),
          PageSelector(label: 'EvenOdd', path: '/evenOdd'),
        ],
      ),
    );
  }
}
