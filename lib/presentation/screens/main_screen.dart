import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/states/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screenState = injector<ScreenState>();

  @override
  Widget build(BuildContext context) {
    screenState.setScreenSize(context);
    return Observer(builder: (context) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          color: colorsBackgroundGame,
          child: Stack(
            clipBehavior: Clip.none,
            children: [],
          ),
        ),
      );
    });
  }
}
