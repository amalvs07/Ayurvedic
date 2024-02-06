import 'package:flutter/material.dart';

class CustomLableText extends StatelessWidget {
  final String Label;
  const CustomLableText({super.key, required this.Label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Text(
          Label,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}