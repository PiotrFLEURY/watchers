import 'package:example/pages/even_odd/widgets/colored_container.dart';
import 'package:example/watchers/even_or_odd.dart';
import 'package:flutter/material.dart';

class EvenOddPage extends StatelessWidget {
  const EvenOddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EvenOrOdd(
        state: EvenOddState(0),
        builders: {
          'even': _buildEven,
          'odd': _buildOdd,
        },
      ),
    );
  }

  Widget _buildEven(BuildContext context) {
    return const ColoredContainer(
      text: 'Even',
      color: Colors.green,
    );
  }

  Widget _buildOdd(BuildContext context) {
    return const ColoredContainer(
      text: 'Odd',
      color: Colors.teal,
    );
  }
}
