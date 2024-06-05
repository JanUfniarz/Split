import 'package:flutter/material.dart';

import 'package:split/extensions/tilt.dart';

class Background extends StatelessWidget {
  final int rightShade;
  final int leftShade;

  const Background._(this.rightShade, this.leftShade);

  factory Background(double? tilt) => (tilt ?? 0) >= 0
      ? Background._(0, tilt.toShade())
      : Background._(tilt.toShade(), 0);

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(2, (index) => Expanded(
        child: Container(
          color: (rightShade == leftShade
              ? List.filled(2, Colors.lightGreenAccent)
              : [Colors.red[rightShade], Colors.red[leftShade]]
          )[index],
        ),
      ))
  );
}