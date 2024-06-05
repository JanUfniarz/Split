import 'package:flutter/material.dart';

ThemeData theme = ThemeData(

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontSize: 20
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:  MaterialStateProperty
        .resolveWith<Color>((Set<MaterialState> states) => states
        .contains(MaterialState.pressed)
          ? Colors.grey
          : Colors.deepPurple[50]!),
      textStyle: const MaterialStatePropertyAll(TextStyle(
        fontSize: 14
      ))
    )
  )
);