import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListOfDays extends StatefulWidget {
  const ListOfDays({Key? key}) : super(key: key);

  @override
  State<ListOfDays> createState() => _ListOfDaysState();
}

class _ListOfDaysState extends State<ListOfDays> {
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (_, orientation) {
      return SizedBox(
          height: orientation.index == 1
              ?  MediaQuery.of(context).size.height
              : 120,
          width: orientation.index == 1
              ? 120.0
              : MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection:
                orientation.index == 0 ? Axis.horizontal : Axis.vertical,
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
                  color: colorsButtonMain,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(weatherInfo.getDayOfWeekFromDateFormatted()),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Image.network(
                            weatherInfo.getImageLink(),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Text("Your ad here! 555-555-555");
                            },
                            width: 42,
                          ),
                        ),
                        Observer(builder: (context) {
                          return Text(
                              "${weatherInfo.getMinTempFormatted()}..${weatherInfo.getMaxTempFormatted()}");
                        }),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ));
    });
  }
}
