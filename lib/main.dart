import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const SplitApp());
}


extension on AsyncSnapshot<AccelerometerEvent> {
  static double _fix = 0;

  void calibrate() => _fix = data == null ? 0 : data!.y;

  String get fixedY => data == null
      ? "Loading..."
      : (data!.y - _fix).toStringAsFixed(2);
}


class SplitApp extends StatelessWidget {
  const SplitApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(

    home: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.menu),
      ),
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(2, (index) => Expanded(
              child: Container(
                color: [Colors.cyan, Colors.red][index],
              ),
            ))
          ),
          StreamBuilder<AccelerometerEvent>(
            stream: accelerometerEventStream(),
            builder: (context, snapshot) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("value: ${snapshot.fixedY}",
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () => snapshot.calibrate(),
                      child: const Text("Calibration")
                    )
                  ],
                ),
              );
            }
          )
        ],
      ),
    ),
  );
}