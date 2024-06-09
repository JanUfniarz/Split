import 'package:flutter/material.dart';
import 'package:split/widgets/buttons/coins_button.dart';

class ScaleScreen extends StatelessWidget {
  final double? tilt;

  const ScaleScreen({this.tilt, super.key});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned(
        top: 16,
        right: 16,
        child: CoinsButton(
          onCoinPick: (coinWeight) {},
        ),
      ),
    ],
  );
}