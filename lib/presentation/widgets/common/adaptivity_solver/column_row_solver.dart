import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/states/screen_state.dart';
import 'package:flutter/material.dart';

class ColumnRowSolver extends StatefulWidget {
  const ColumnRowSolver({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  _NewGameWidgetsOrientationSolver createState() =>
      _NewGameWidgetsOrientationSolver();
}

class _NewGameWidgetsOrientationSolver extends State<ColumnRowSolver> {
  final screenState = injector<ScreenState>();

  @override
  Widget build(BuildContext context) {
    return screenState.isPortrait(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: widget.children)
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: widget.children);
  }
}
