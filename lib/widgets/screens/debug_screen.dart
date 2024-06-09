import 'package:flutter/material.dart';
import 'package:split/extensions/theme_access.dart';

// Debug
class DebugScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const DebugScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      children: data.entries.map(
              (el) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${el.key}: ${el.value ?? "null"}",
                  style: context.texts.labelLarge,
                ),
              )
      ).toList()
    ),
  );
}
