import 'package:example/pages/simon/color_square.dart';
import 'package:example/pages/simon/model.dart';
import 'package:flutter/widgets.dart';

class SimonWidget extends StatefulWidget {
  const SimonWidget({super.key});

  @override
  State<SimonWidget> createState() => _SimonWidgetState();
}

class _SimonWidgetState extends State<SimonWidget> {
  int topLeft = 0xff0000FF;
  int topRight = 0xff00FF00;
  int bottomLeft = 0xffFF0000;
  int bottomRight = 0xff00FFFF;

  @override
  Widget build(BuildContext context) {
    return SimonModel(
      topLeftColor: topLeft,
      topRightColor: topRight,
      bottomLeftColor: bottomLeft,
      bottomRightColor: bottomRight,
      child: Column(
        children: [
          Row(
            children: [
              _buildTopLeft(context),
              _buildTopRight(context),
            ],
          ),
          Row(
            children: [
              _buildBottomLeft(context),
              _buildBottomRight(context),
            ],
          ),
        ],
      ),
    );
  }

  void topLeftPressed() {
    setState(() {
      topLeft += 16;
    });
  }

  void topRightPressed() {
    setState(() {
      topRight += 16;
    });
  }

  void bottomLeftPressed() {
    setState(() {
      bottomLeft += 16;
    });
  }

  void bottomRightPressed() {
    setState(() {
      bottomRight += 16;
    });
  }

  Widget _buildTopLeft(BuildContext context) {
    debugPrint('buildTopLeft');
    final model = SimonModel.of(context, 'topLeft');
    return ColorSquare(
      color: Color(model.topLeftColor),
      onPressed: topLeftPressed,
    );
  }

  Widget _buildTopRight(BuildContext context) {
    debugPrint('buildTopRight');
    final model = SimonModel.of(context, 'topRight');
    return ColorSquare(
      color: Color(model.topRightColor),
      onPressed: topRightPressed,
    );
  }

  Widget _buildBottomLeft(BuildContext context) {
    debugPrint('buildBottomLeft');
    final model = SimonModel.of(context, 'bottomLeft');
    return ColorSquare(
      color: Color(model.bottomLeftColor),
      onPressed: bottomLeftPressed,
    );
  }

  Widget _buildBottomRight(BuildContext context) {
    debugPrint('buildBottomRight');
    final model = SimonModel.of(context, 'bottomRight');
    return ColorSquare(
      color: Color(model.bottomRightColor),
      onPressed: bottomRightPressed,
    );
  }
}
