import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'package:split/config/theme.dart';
import 'package:split/extensions/calibration.dart';
import 'package:split/widgets/background.dart';
import 'package:split/widgets/content.dart';
import 'package:split/widgets/buttons/menu_button.dart';
import 'package:split/enums/mode.dart';

class SplitApp extends StatefulWidget {
  const SplitApp({super.key});

  @override
  State<SplitApp> createState() => _SplitAppState();
}

class _SplitAppState extends State<SplitApp> {
  Content? content;

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: theme,
    home: StreamBuilder<AccelerometerEvent>(
      stream: accelerometerEventStream(),
      builder: (context, snapshot) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: MenuButton(
          onModeChange: (mode) => setState(
              () => content = Content(mode)
          ),
        ),
        body: Stack(
          children: <Widget>[
            Background(snapshot.fixedY),
            content ?? const Content(Mode.split),
          ],
        ),
      ),
    ),
  );
}