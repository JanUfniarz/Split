import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:split/data/coins.dart';
import 'package:split/extensions/theme_access.dart';

class CoinsButton extends StatelessWidget {
  final void Function(double coinWeight) onCoinPick;

  const CoinsButton({super.key, required this.onCoinPick});

  @override
  Widget build(BuildContext context) => SpeedDial(
    childPadding: const EdgeInsets.symmetric(
      horizontal: 5
    ),
    shape: context.fabShape!,
    icon: Icons.monetization_on_outlined,
    direction: SpeedDialDirection.left,
    children: coins.entries.map((coin) => SpeedDialChild(
      onTap: () => onCoinPick(coin.value),
      child: Text(coin.key)
    )).toList(),
  );
}
