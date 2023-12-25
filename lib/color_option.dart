
import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  final Color color;
  final ValueChanged<Color> onSelectColor;

  const ColorOption({super.key, required this.color, required this.onSelectColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectColor(color);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}