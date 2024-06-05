import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

extension Calibration on AsyncSnapshot<AccelerometerEvent> {
  static double _fix = 0;

  void calibrate() => _fix = data == null ? 0 : data!.y;

  double? get fixedY => data == null
      ? null
      : data!.y - _fix;
}