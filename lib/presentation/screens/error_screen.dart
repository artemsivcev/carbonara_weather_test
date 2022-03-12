import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/button.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsBackgroundMain,
      body: Observer(builder: (context) {
        if (mainState.isLoading) {
          return const Loader();
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Something went wrong, try retry!",
                textAlign: TextAlign.center,
                style: textStyleMain40,
              ),
              const SizedBox(
                height: 16,
              ),
              Button(
                text: 'Retry',
                onButtonTap: () => {
                  mainState
                      .fetchDataByCurrentCity()
                      .then(
                        (value) => Navigator.pop(context),
                      )
                      .onError((error, stackTrace) {
                    mainState.isLoading = false;
                  }),
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
