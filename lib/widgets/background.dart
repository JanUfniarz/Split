import 'package:flutter/material.dart';

import 'package:split/extensions/tilt.dart';

class Background extends StatelessWidget {
  final int leftShade;
  final int rightShade;

  const Background._(this.leftShade, this.rightShade);

  factory Background(double? tilt) => (tilt ?? 0) >= 0
      ? Background._(0, tilt.toShade())
      : Background._(tilt.toShade(), 0);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: List.generate(2, (index) => Expanded(
      child: Container(
        color: leftShade == rightShade
            ? Colors.lightGreenAccent
            : [Colors.red[leftShade], Colors.red[rightShade]][index],
      ),
    ))
  );
}