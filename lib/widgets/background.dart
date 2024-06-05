import 'package:flutter/material.dart';

int Function(double? tilt) toShade = (tilt) {
  double res = (tilt ?? 0).abs();
  if (res > 2) res = 2;
  return ((res * 450) ~/ 100) * 100;
};

class Background extends StatelessWidget {
  final int rightShade;
  final int leftShade;

  const Background._(this.rightShade, this.leftShade);

  factory Background(double? tilt) => (tilt ?? 0) >= 0
      ? Background._(toShade(tilt), 0)
      : Background._(0, toShade(tilt));

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