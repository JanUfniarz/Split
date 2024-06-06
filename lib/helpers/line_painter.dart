import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double? touchX;

  LinePainter(this.touchX);

  @override
  void paint(Canvas canvas, Size size) => canvas.drawLine(
      Offset(touchX ?? (size.width / 2), 0),
      Offset(touchX ?? (size.width / 2), size.height),
      Paint()
        ..color = Colors.indigo
        ..strokeWidth = 3
  );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}