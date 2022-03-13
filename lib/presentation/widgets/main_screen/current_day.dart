import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/domain/states/screen_state.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/parameter_with_icon_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// Widget with current day weather info
/// Represent ability of custom screenState and image resize
/// We can move all this resize logic into the state
class CurrentDay extends StatefulWidget {
  const CurrentDay({Key? key}) : super(key: key);

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {
  final mainState = injector<MainState>();
  final screenState = injector<ScreenState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      var isPortrait = screenState.isPortrait(context);
      var imageSize = MediaQuery.of(context).size.width * 0.5;
      if (!isPortrait) {
        imageSize = MediaQuery.of(context).size.height * 0.2;
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${mainState.selectedWeather?.getDateFormatted()}",
              style: textStyleMain16,
            ),
          ),
          Image.network(
            mainState.selectedWeather?.getImageLink() ?? "",
            width: imageSize,
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
          InkWell(
            onTap: () => {
              mainState.changeDegrees(),
            },
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                mainState.selectedWeather?.getTheTempFormatted() ?? "",
                style: textStyleMain40,
              ),
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
