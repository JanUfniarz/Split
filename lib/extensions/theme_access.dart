import 'package:flutter/material.dart';

extension ThemeAccess on BuildContext {
  ShapeBorder? get fabShape => Theme.of(this)
      .floatingActionButtonTheme.shape;

  TextTheme get texts => Theme.of(this).textTheme;
}