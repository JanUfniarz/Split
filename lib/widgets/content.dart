import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'package:split/extensions/calibration.dart';
import 'package:split/extensions/theme_access.dart';
import 'package:split/enums/mode.dart';
import 'package:split/widgets/calibration_screen.dart';

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

      Mode.split: SplitScreen(snapshot.fixedY),

      Mode.scale: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("value: ${snapshot.fixedY
                ?.toStringAsFixed(2) ?? "Loading..."}",
                style: context.texts.labelLarge
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),

    }[mode]!,
  );
}

class SplitScreen extends StatelessWidget {
  final int leftPercent;
  final int rightPercent;

  const SplitScreen._(this.leftPercent, this.rightPercent);
  factory SplitScreen(double? tilt) => SplitScreen._(2,3);


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
