import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:flutter/material.dart';

/// Widget with iconData and some text
class ParameterWithIconRow extends StatelessWidget {
  const ParameterWithIconRow({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 21,
            color: colorsTextButton,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(text, style: textStyleMain16),
        ],
      ),
    );
  }
}
