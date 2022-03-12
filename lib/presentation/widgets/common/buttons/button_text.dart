import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/states/screen_state.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  ButtonText({
    Key? key,
    required this.btnText,
    this.paddingSize = 20.0,
    this.fontSize,
  }) : super(key: key);

  final String btnText;
  final screenState = injector<ScreenState>();
  final double paddingSize;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    var isPortrait = screenState.isPortrait(context);
    return Padding(
      padding: isPortrait
          ? EdgeInsets.fromLTRB(0.0, paddingSize, paddingSize, paddingSize)
          : EdgeInsets.fromLTRB(paddingSize, 0.0, paddingSize, paddingSize),
      child: Text(
        btnText,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: fontSize ?? 23,
          fontWeight: FontWeight.w900,
          color: colorsPurpleBluePrimary,
        ),
      ),
    );
  }
}
