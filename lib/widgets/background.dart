import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(2, (index) => Expanded(
        child: Container(
          color: [Colors.cyan, Colors.red][index],
        ),
      ))
  );
}