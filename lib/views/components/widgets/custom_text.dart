import 'package:flutter/material.dart';
import 'package:nano_board/views/styles/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomText({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? darkBackground.withOpacity(0.6),
          fontWeight: FontWeight.bold,
          fontSize: 16),
    );
  }
}
