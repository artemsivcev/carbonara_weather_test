import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:flutter/material.dart';

class ListOfDays extends StatefulWidget {
  const ListOfDays({Key? key}) : super(key: key);

  @override
  State<ListOfDays> createState() => _ListOfDaysState();
}

class _ListOfDaysState extends State<ListOfDays> {
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              mainState.lastLoadedWeather?.consolidated_weather.length ?? 0,
              (int index) {
            var weatherInfo =
                mainState.lastLoadedWeather?.consolidated_weather[index];
            if (weatherInfo == null) {
              return Container();
            }
            return InkWell(
              onTap: () => {
                mainState.selectDay(index),
              },
              child: Card(
                color: Colors.blue[index * 100],
                child: Column(
                  children: [
                    Text(weatherInfo.getDayOfWeekFromDateFormatted()),
                    Image.network(
                        mainState.selectedWeather?.getImageLink() ?? ""),
                    Text(
                        "${weatherInfo.getMinTempFormatted()}..${weatherInfo.getMaxTempFormatted()}"),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
