import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:split/enums/mode.dart';
import 'package:split/extensions/calibration.dart';
import 'package:split/extensions/theme_access.dart';
import 'package:split/widgets/screens/calibration_screen.dart';
import 'package:split/widgets/screens/debug_screen.dart';
import 'package:split/widgets/screens/scale_screen.dart';
import 'package:split/widgets/screens/split_screen.dart';

Widget contentFactory(Mode mode, BuildContext context) =>
    StreamBuilder<AccelerometerEvent>(
      stream: accelerometerEventStream(),
      builder: (context, snapshot) => <Mode, Widget>{

        Mode.calibration: CalibrationScreen(
          onAccept: (weightCenter) => snapshot.calibrate(weightCenter),
        ),

        Mode.split: const SplitScreen(),

        Mode.scale: ScaleScreen(
          tilt: snapshot.fixedY,
        ),

        Mode.debug: DebugScreen(data: {
          "y": snapshot.data?.y,
          "fixedY": snapshot.fixedY,
          "screen width": context.screenMiddle * 2,
          "screen middle": context.screenMiddle,
          "weight center": snapshot.weightCenter,
        })

      }[mode]!,
    );