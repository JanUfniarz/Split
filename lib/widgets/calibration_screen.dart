import 'package:flutter/material.dart';
import 'package:split/extensions/theme_access.dart';

import '../helpers/line_painter.dart';

class CalibrationScreen extends StatefulWidget {
  final void Function(double weightCenter) onAccept;

  const CalibrationScreen({required this.onAccept, super.key});

  @override
  State<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends State<CalibrationScreen> {
  double? _touchX;

  @override
  Widget build(BuildContext context) => Stack(
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Text("1. Ley phone flat\n "
              "2. Place line exactly where phone and \n"
              "     fork are touching each other",
              style: context.texts.labelLarge
          ),
        ),
      ),
      GestureDetector(
        onPanUpdate: (details) => setState(
                () => _touchX = details.localPosition.dx
        ),
        child: CustomPaint(
          painter: LinePainter(_touchX),
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
      Positioned(
        bottom: 100,
        left: (_touchX ?? context.screenMiddle) - 40,
        child: ElevatedButton(
          onPressed: () => widget.onAccept(
              _touchX ?? context.screenMiddle
          ),
          child: const Text("Accept"),
        ),
      ),
    ],
  );
}