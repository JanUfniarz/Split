import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:split/extensions/calibration.dart';
import 'package:split/widgets/background.dart';
import 'package:split/widgets/menu_button.dart';
import 'package:split/config/theme.dart';

class SplitApp extends StatelessWidget {
  const SplitApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: theme,
    home: StreamBuilder<AccelerometerEvent>(
      stream: accelerometerEventStream(),
      builder: (context, snapshot) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          floatingActionButton: const MenuButton(),
          body: Stack(
            children: <Widget>[
              Background(snapshot.fixedY),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("value: ${snapshot.fixedY
                          ?.toStringAsFixed(2) ?? "Loading..."}",
                      style: Theme.of(context).textTheme.labelLarge
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () => snapshot.calibrate(),
                        child: const Text("Calibration")
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    ),
  );
}