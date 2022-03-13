import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/presentation/widgets/error_screen/error_with_text.dart';
import 'package:carbonara_weather_test/presentation/widgets/main_screen/search_bar.dart';
import 'package:flutter/material.dart';

import 'current_day.dart';
import 'list_of_days.dart';

/// Portrait Orientation widgets location
class PortraitOrientation extends StatelessWidget {
  PortraitOrientation({Key? key}) : super(key: key);
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBar(),
        mainState.searchingError ? const ErrorWithText() : const CurrentDay(),
        const Spacer(),
        mainState.searchingError ? Container() : const ListOfDays(),
      ],
    );
  }
}
