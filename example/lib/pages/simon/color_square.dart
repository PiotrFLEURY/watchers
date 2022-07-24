import 'package:flutter/material.dart';

class ColorSquare extends StatelessWidget {
  final Color color;
  final void Function() onPressed;

  const ColorSquare({
    super.key,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        color: color,
      ),
    );
  }
}
