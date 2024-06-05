import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:split/extensions/theme_access.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) => SpeedDial(
    shape: context.fabShape!,
    icon: Icons.menu,
    direction: SpeedDialDirection.down,
    children: List.generate(3, (index) => SpeedDialChild(
      child: Icon([
        Icons.compass_calibration_outlined,
        Icons.eco_outlined,
        Icons.monitor_weight_outlined
      ][index])
    ))
  );
}