import 'package:example/watchers/fibonacci.dart';
import 'package:flutter/material.dart';

class FibonnacciPage extends StatelessWidget {
  const FibonnacciPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Fibonnacci(
      builder: (context) => Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Fibonnacci.of(context).suite.increment(),
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: ListView(
            children: [
              const Text('Fibonnacci'),
              ...Fibonnacci.of(context).suite.list.map((e) => Text('$e'))
            ],
          ),
        ),
      ),
    );
  }
}
