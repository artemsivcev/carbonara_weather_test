import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/parameter_with_icon_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CurrentDay extends StatefulWidget {
  const CurrentDay({Key? key}) : super(key: key);

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          Text("${mainState.selectedWeather?.getDateFormatted()}"),
          Image.network(mainState.selectedWeather?.getImageLink() ?? ""),
          Text(mainState.selectedWeather?.weather_state_name ?? ""),
          Text(mainState.selectedWeather?.getTheTempFormatted() ?? ""),
          Row(
            children: [
              ParameterWithIconRow(
                icon: Icons.email,
                text: mainState.selectedWeather?.getHumidityFormatted() ?? "",
              ),
              ParameterWithIconRow(
                icon: Icons.email,
                text:
                    mainState.selectedWeather?.getAirPressureFormatted() ?? "",
              ),
              ParameterWithIconRow(
                icon: Icons.email,
                text: mainState.selectedWeather?.getWindSpeedFormatted() ?? "",
              ),
            ],
          ),
        ],
      );
    });
  }
}
