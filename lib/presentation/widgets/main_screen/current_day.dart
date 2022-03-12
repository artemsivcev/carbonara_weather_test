import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/loader.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/parameter_with_icon_row.dart';
import 'package:flutter/cupertino.dart';
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
          Text(
            "${mainState.selectedWeather?.getDateFormatted()}",
            style: textStyleMain16,
          ),
          Image.network(
            mainState.selectedWeather?.getImageLink() ?? "",
            width: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Text("Your ad here! 555-555-555");
            },
          ),
          Text(
            mainState.selectedWeather?.weather_state_name ?? "",
            style: textStyleMain40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              mainState.selectedWeather?.getTheTempFormatted() ?? "",
              style: textStyleMain40,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ParameterWithIconRow(
                icon: CupertinoIcons.drop,
                text: mainState.selectedWeather?.getHumidityFormatted() ?? "",
              ),
              ParameterWithIconRow(
                icon: Icons.thermostat,
                text:
                    mainState.selectedWeather?.getAirPressureFormatted() ?? "",
              ),
              ParameterWithIconRow(
                icon: Icons.air,
                text: mainState.selectedWeather?.getWindSpeedFormatted() ?? "",
              ),
            ],
          ),
        ],
      );
    });
  }
}
