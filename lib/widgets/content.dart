import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'package:split/extensions/calibration.dart';
import 'package:split/extensions/theme_access.dart';
import 'package:split/enums/mode.dart';

class Content extends StatelessWidget {
  final AsyncSnapshot<AccelerometerEvent> snapshot;
  final Mode mode;

  const Content(this.mode, this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) => {

    Mode.calibration: Placeholder(),

    Mode.split: Placeholder(),

    Mode.scale: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("value: ${snapshot.fixedY
              ?.toStringAsFixed(2) ?? "Loading..."}",
              style: context.texts.labelLarge
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => snapshot.calibrate(),
              child: const Text("Calibration")
          )
        ],
      ),
    )

  }[mode]!;
}