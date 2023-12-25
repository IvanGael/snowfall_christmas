
import 'package:flutter/material.dart';
import 'package:snowfall_christmas/color_option.dart';


class ColorPicker extends StatelessWidget {
  final ValueChanged<Color> onSelectColor;
  final String direction;

  const ColorPicker({super.key, required this.onSelectColor, required this.direction});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: direction == 'row' ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColorOption(color: Colors.red[500]!, onSelectColor: onSelectColor),
          const SizedBox(width: 6),
          ColorOption(color: Colors.amber[800]!, onSelectColor: onSelectColor),
          const SizedBox(width: 6),
          ColorOption(color: Colors.blue[500]!, onSelectColor: onSelectColor),
          const SizedBox(width: 6),
          ColorOption(color: Colors.cyan, onSelectColor: onSelectColor),
        ],
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColorOption(color: Colors.red[500]!, onSelectColor: onSelectColor),
          const SizedBox(height: 6),
          ColorOption(color: Colors.amber[800]!, onSelectColor: onSelectColor),
          const SizedBox(height: 6),
          ColorOption(color: Colors.blue[500]!, onSelectColor: onSelectColor),
          const SizedBox(height: 6),
          ColorOption(color: Colors.cyan[800]!, onSelectColor: onSelectColor),
        ],
      ),
    );
  }
}
