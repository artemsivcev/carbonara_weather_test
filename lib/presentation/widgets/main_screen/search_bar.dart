import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: mainState.userCityController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.transparent,
          filled: true,
          prefixIcon: Icon(
            Icons.add_location_alt,
            size: 21,
            color: colorsTextButton,
          ),
        ),
        cursorColor: colorsTextButton,
        style: textStyleMain24,
        onEditingComplete: () => {
              FocusScope.of(context).unfocus(),
              mainState.fetchDataByCurrentCity(),
            });
  }
}
