import 'package:flutter/material.dart';
import 'package:split/extensions/theme_access.dart';
import 'package:split/widgets/buttons/coins_button.dart';

class ScaleScreen extends StatelessWidget {
  final double? tilt;

  const ScaleScreen({this.tilt, super.key});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("value: ${tilt?.toStringAsFixed(2)
                ?? "Loading..."}",
                style: context.texts.labelLarge
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
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