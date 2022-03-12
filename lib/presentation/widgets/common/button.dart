import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:flutter/material.dart';

/// Custom class for buttons
/// Ability to call function on tap it
class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onButtonTap,
  }) : super(key: key);

  final String text;
  final Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: SizedBox(
        height: 56,
        width: 120,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder?>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            overlayColor: MaterialStateProperty.all<Color?>(
              Colors.transparent,
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                return colorsButtonMain;
              },
            ),
          ),
          onPressed: () async => await onButtonTap(),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: textStyleButton,
            ),
          ),
        ),
      ),
    );
  }
}
