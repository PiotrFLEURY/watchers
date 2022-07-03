import 'package:flutter/material.dart';

class PageSelector extends StatelessWidget {
  final String label;
  final String path;

  const PageSelector({
    super.key,
    required this.label,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(path),
      child: ListTile(
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
