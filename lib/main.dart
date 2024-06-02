import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() => runApp(const SplitApp());

class SplitApp extends StatelessWidget {
  const SplitApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
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
                child: Text("value: ${snapshot.data!.y.toStringAsFixed(2)}\n"),
              );
            }
          )
        ],
      ),
    ),
  );
}