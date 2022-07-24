import 'package:example/pages/simon/widget.dart';
import 'package:flutter/material.dart';

class SimonPage extends StatelessWidget {
  const SimonPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build entire page');
    return const Scaffold(
      body: SimonWidget(),
    );
  }
}
