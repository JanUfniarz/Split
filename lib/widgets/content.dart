import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'package:split/extensions/calibration.dart';
import 'package:split/enums/mode.dart';
import 'package:split/widgets/screens/calibration_screen.dart';
import 'package:split/widgets/screens/scale_screen.dart';
import 'package:split/widgets/screens/split_screen.dart';

class Content extends StatelessWidget {
  final Mode mode;

  const Content(this.mode, {super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder<AccelerometerEvent>(
    stream: accelerometerEventStream(),
    builder: (context, snapshot) => <Mode, Widget>{

      Mode.calibration: CalibrationScreen(
        onAccept: (weightCenter) => snapshot.calibrate(weightCenter),
      ),

      Mode.split: const SplitScreen(),

      Mode.scale: ScaleScreen(
        tilt: snapshot.fixedY,
      ),

    }[mode]!,
  );
}