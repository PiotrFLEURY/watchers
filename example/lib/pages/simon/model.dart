import 'package:flutter/widgets.dart';

class SimonModel extends InheritedModel<String> {
  final int topLeftColor;
  final int topRightColor;
  final int bottomLeftColor;
  final int bottomRightColor;

  static SimonModel of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<SimonModel>(context)!;
  }

  const SimonModel({
    super.key,
    required this.topLeftColor,
    required this.topRightColor,
    required this.bottomLeftColor,
    required this.bottomRightColor,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SimonModel oldWidget) {
    return topLeftColor != oldWidget.topLeftColor ||
        topRightColor != oldWidget.topRightColor ||
        bottomLeftColor != oldWidget.bottomLeftColor ||
        bottomRightColor != oldWidget.bottomRightColor;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant SimonModel oldWidget, Set<String> dependencies) {
    if (dependencies.contains('topLeft') &&
        topLeftColor != oldWidget.topLeftColor) {
      return true;
    }
    if (dependencies.contains('topRight') &&
        topRightColor != oldWidget.topRightColor) {
      return true;
    }
    if (dependencies.contains('bottomLeft') &&
        bottomLeftColor != oldWidget.bottomLeftColor) {
      return true;
    }
    if (dependencies.contains('bottomRight') &&
        bottomRightColor != oldWidget.bottomRightColor) {
      return true;
    }
    return false;
  }
}
