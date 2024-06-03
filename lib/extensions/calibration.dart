import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

extension Calibration on AsyncSnapshot<AccelerometerEvent> {
  static double _fix = 0;

  void calibrate() => _fix = data == null ? 0 : data!.y;

  String get fixedY => data == null
      ? "Loading..."
      : (data!.y - _fix).toStringAsFixed(2);
}