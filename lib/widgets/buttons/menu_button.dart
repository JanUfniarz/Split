import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:split/extensions/theme_access.dart';

import '../../enums/mode.dart';

class MenuButton extends StatelessWidget {
  final void Function(Mode mode) onModeChange;

  const MenuButton({
    required this.onModeChange,
    super.key
  });

  @override
  Widget build(BuildContext context) => SpeedDial(
    shape: context.fabShape!,
    icon: Icons.menu,
    direction: SpeedDialDirection.down,
    children: List.generate(3, (index) => SpeedDialChild(
      child: Icon([
        Icons.compass_calibration_outlined,
        Icons.eco_outlined,
        Icons.scale_outlined
      ][index]),
      onTap: () => onModeChange(Mode.values[index]),
    ))
  );
}