import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

extension Calibration on AsyncSnapshot<AccelerometerEvent> {
  static double _fix = 0;
  static double? _weightCenter;

  void calibrate(double weightCenter) {
    _fix = data == null ? 0 : data!.y;
    _weightCenter = weightCenter;
  }

  double? get weightCenter => _weightCenter;

  double? get fixedY => data == null
      ? null
      : data!.y - _fix;
}