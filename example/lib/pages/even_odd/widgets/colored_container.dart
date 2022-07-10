import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Color color;
  final String text;

  const ColoredContainer({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 76.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
